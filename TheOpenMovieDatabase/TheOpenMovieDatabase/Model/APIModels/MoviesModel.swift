//
//  SearchModel.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 25.09.2022.
//

import Foundation

struct Movies: Codable {
    let title, year, imdbID: String?
    let type: String?
    let poster: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

enum TypeEnum: String, Codable {
    case movie = "movie"
    case series = "series"
}
