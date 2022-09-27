//
//  RequestType.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 23.09.2022.
//

import Foundation

struct URLConstants {
    static let baseURL = "http://www.omdbapi.com/?"
    static let apiKey = "apikey=61c3f542"
    static let movieTitleKey = "&s="
    static let pageKey = "&page="
    static let imbdIDKey = "&i="
    static let plotKey = "&plot=full"
}
enum RequestType {
    case search(movieTitle : String,page : Int = 1)
    case detail(imbdID : String)
    
    var endPoint : String {
        switch self {
        case .search(let movieTitle, let page):
            return URLConstants.baseURL + URLConstants.apiKey + URLConstants.movieTitleKey + movieTitle + URLConstants.pageKey + page.toString
        case .detail(let imbdID):
            return URLConstants.baseURL + URLConstants.apiKey + URLConstants.imbdIDKey + imbdID + URLConstants.plotKey
        }
    }
    var httpMethod : HttpMethod {
        switch self {
        case .search(_,_):
            return .GET
        case .detail(_):
            return .GET
        }
    }
}

enum HttpMethod : String {
    case GET
    case POST
}
