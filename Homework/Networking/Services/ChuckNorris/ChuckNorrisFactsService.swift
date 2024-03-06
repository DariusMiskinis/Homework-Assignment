//
//  ChuckNorrisFactsService.swift
//  Homework
//
//  Created by Darius Miskinis on 2024-03-05.
//

import Foundation

protocol ChuckNorrisFactsProvidable {
    func getChuckNorrisFact() async throws -> InterestingInformationProvidable
}

final class ChuckNorrisFactsService {
    private let networkManager: NetworkManagable
    private let apiBaseUrlString = "https://api.chucknorris.io"

    init(networkManager: NetworkManagable) {
        self.networkManager = networkManager
    }
}

extension ChuckNorrisFactsService: ChuckNorrisFactsProvidable {
    func getChuckNorrisFact() async throws -> InterestingInformationProvidable {
        let endpointString = "/jokes/random"
        return try await networkManager.fetchData(from: apiBaseUrlString + endpointString, decodingType: ChuckNorrisFactResponse.self)
    }
}
