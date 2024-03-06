//
//  AsyncDadJokeService.swift
//  Homework
//
//  Created by Darius Miskinis on 2024-03-05.
//

import Foundation

protocol DadJokesProvidable {
    func getDadJoke() async throws -> InterestingInformationProvidable
}

final class DadJokesService {
    private let networkManager: NetworkManagable
    private let apiBaseUrlString = "https://icanhazdadjoke.com/"

    init(networkManager: NetworkManagable) {
        self.networkManager = networkManager
    }
}

extension DadJokesService: DadJokesProvidable {
    func getDadJoke() async throws -> InterestingInformationProvidable {
        return try await networkManager.fetchData(from: apiBaseUrlString, decodingType: DadJokeResponse.self)
    }
}
