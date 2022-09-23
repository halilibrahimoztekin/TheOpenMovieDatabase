//
//  APIErrorModel.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 23.09.2022.
//

import Foundation

struct APIErrorModel: Codable, Error {
    let response, error: String?

    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case error = "Error"
    }
    
}
