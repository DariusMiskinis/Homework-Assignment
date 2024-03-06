//
//  MockedDadJokesService.swift
//  Homework
//
//  Created by Darius Miskinis on 2024-03-06.
//

import Foundation

final class MockedDadJokesService {}

extension MockedDadJokesService: DadJokesProvidable {
    func getDadJoke() async throws -> InterestingInformationProvidable {
        try await Task.sleep(nanoseconds: 2_000_000_000)
        
        return DadJokeResponse(
            id: "1",
            joke: "Mocked dad joke",
            status: 200
        )
    }
}
