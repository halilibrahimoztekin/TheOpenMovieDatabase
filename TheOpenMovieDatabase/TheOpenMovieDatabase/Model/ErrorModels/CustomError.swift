//
//  CustomError.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 23.09.2022.
//

import Foundation

enum CustomError: Error {
    case decodingError(model: APIErrorModel)
    case dataError
    case urlError
    case responseError
    case noMoreMovie

    var message: String{
        switch self {
        case .decodingError(let model):
            return model.error ?? "Decode Error"
        case .dataError:
            return "Check your internet connection."
        case .urlError:
            return "Url error"
        case .responseError:
            return "Response Error"
        case .noMoreMovie:
            return "We can't find more movie. Please research with new keyword."
        }
    }
}


