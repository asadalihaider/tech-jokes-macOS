//
//  Joke.swift
//  Tech Jokes
//
//  Created by Asad Ali Haider on 31/12/2023.
//

import Foundation

struct Joke: Codable {
    let error: Bool
    let category: String?
    let type: String?
    let joke: String?
    let flags: Flags?
    let id: Int?
    let safe: Bool?
    let lang: String?
    let internalError: Bool?
    let code: Int?
    let message: String?
    let causedBy: [String]?
    let additionalInfo: String?
    let timestamp: Int?
}

struct Flags: Codable {
    let nsfw: Bool?
    let religious: Bool?
    let political: Bool?
    let racist: Bool?
    let sexist: Bool?
    let explicit: Bool?
}
