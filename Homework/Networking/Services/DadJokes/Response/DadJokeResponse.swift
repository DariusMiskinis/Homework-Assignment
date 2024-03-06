//
//  DadJokeResponse.swift
//  Homework
//
//  Created by Darius Miskinis on 2024-03-05.
//

import Foundation

struct DadJokeResponse: Decodable {
    let id: String
    let joke: String
    let status: Int
}


extension DadJokeResponse: InterestingInformationProvidable {
    var interestingText: String { joke }
}
