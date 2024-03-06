//
//  NetworkError.swift
//  Homework
//
//  Created by Darius Miskinis on 2024-03-02.
//

enum NetworkError: Error {
    case invalidURL
    case badResponse(statusCode: Int)
    case decodingError
}
