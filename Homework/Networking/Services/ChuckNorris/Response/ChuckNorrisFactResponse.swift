//
//  ChuckNorrisFactResponse.swift
//  Homework
//
//  Created by Darius Miskinis on 2024-03-05.
//

import Foundation

struct ChuckNorrisFactResponse: Decodable {
    let icon_url: String
    let id: String
    let url: String
    let value: String
}

extension ChuckNorrisFactResponse: InterestingInformationProvidable {
    var interestingText: String { self.value }
}
