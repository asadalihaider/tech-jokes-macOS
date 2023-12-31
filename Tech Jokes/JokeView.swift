//
//  ContentView.swift
//  Tech Jokes
//
//  Created by Asad Ali Haider on 31/12/2023.
//

import SwiftUI

struct JokeView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    JokeView()
}
