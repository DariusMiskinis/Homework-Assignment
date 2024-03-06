//
//  NetworkManager.swift
//  Homework
//
//  Created by Darius Miskinis on 2024-03-02.
//

import Foundation

protocol NetworkManagable {
    func fetchData<T: Decodable>(from urlString: String, decodingType: T.Type) async throws -> T
}

final class NetworkManager {}

extension NetworkManager: NetworkManagable {

    func fetchData<T: Decodable>(from urlString: String, decodingType: T.Type) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }

        let request = makeRequest(from: url)
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.badResponse(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)
        }

        return try decode(from: data, decodingType: T.self)
    }

    private func decode<T: Decodable>(from data: Data, decodingType: T.Type) throws -> T {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.decodingError
        }
    }

    private func makeRequest(from url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
