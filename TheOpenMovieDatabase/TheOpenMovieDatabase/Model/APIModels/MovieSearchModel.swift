//
//  MainModel.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 23.09.2022.
//

import Foundation
struct MovieSearchModel: Codable {
    let search: [Movies]?
    let totalResults, response: String?

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}






