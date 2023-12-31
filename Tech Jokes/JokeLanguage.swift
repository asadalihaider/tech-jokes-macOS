//
//  JokeLanguage.swift
//  Tech Jokes
//
//  Created by Asad Ali Haider on 31/12/2023.
//

import Foundation

enum JokeLanguage: String, Codable, CaseIterable {
    case english = "English",
    Czech = "Czech",
    German = "German",
    Spanish = "Spanish",
    French = "French",
    Portuguese = "Portuguese"

    var language: String {
        switch self {
        case .english:
            return "en"
        case .Czech:
            return "cs"
        case .German:
            return "de"
        case .Spanish:
            return "es"
        case .French:
            return "fr"
        case .Portuguese:
            return "pt"
        }
    }
}
