//
//  ContentView.swift
//  Tech Jokes
//
//  Created by Asad Ali Haider on 31/12/2023.
//

import SwiftUI

struct JokeView: View {
    @State private var jokeString = "No Joke Available"
    @State private var fetching = false
    @AppStorage("jokeLanguage") var jokeLanguage: JokeLanguage = .english
    var body: some View {
        VStack {
            HStack(alignment: .center, content: {
                // app logo
                Image("TJ")
                    .resizable()
                    .frame(width: 100, height: 100)

                // add picker to select language
                VStack {
                    Text("Select Language")
                        .font(.body)
                    Picker("", selection: $jokeLanguage) {
                        ForEach(JokeLanguage.allCases, id: \.self) { item in
                            Text(item.rawValue).tag(item)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .onChange(of: jokeLanguage) { _, newValue in
                        Task {
                            await getJoke(newValue.language)
                        }
                    }
                }
            })
            
            // show loader while calling API
            if fetching {
                ProgressView()
                    .padding(.top, 10.0)
            } else {
                // display joke
                Text(jokeString)
                    .minimumScaleFactor(0.5)
                    .padding(.top, 10.0)
                    .multilineTextAlignment(.center)
            }
            Spacer()
        }
        .padding()
        .task {
            await getJoke(jokeLanguage.language)
        }
    }
    
    func getJoke(_ language: String) async {
        let url = "https://v2.jokeapi.dev/joke/Programming?type=single&lang=\(language)"
        let apiService = APIService(urlString: url)
        fetching.toggle()
        defer {
            fetching.toggle()
        }
        do {
            let joke: Joke = try await apiService.getJSON()
            jokeString = (joke.error ? "No Joke Available" : joke.joke)!
        } catch {
            jokeString = error.localizedDescription
        }
    }
}

#Preview {
    JokeView()
        .frame(width: 255)
}
