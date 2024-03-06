//
//  MockedChuckNorrisFactsService.swift
//  Homework
//
//  Created by Darius Miskinis on 2024-03-06.
//

import Foundation

final class MockedChuckNorrisFactsService {}

extension MockedChuckNorrisFactsService: ChuckNorrisFactsProvidable {
    func getChuckNorrisFact() async throws -> InterestingInformationProvidable {
        return ChuckNorrisFactResponse(
            icon_url: "http://example.com/image.jog",
            id: "1",
            url: "http://example.com",
            value: "Mocked Chuck Norris fact"
        )
    }
}
