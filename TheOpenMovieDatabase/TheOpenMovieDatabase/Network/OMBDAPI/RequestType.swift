//
//  RequestType.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 23.09.2022.
//

import Foundation

enum URLConstants  : String {
    case baseURL = "http://www.omdbapi.com/?"
    case apiKey = "apikey=61c3f542"
    case movieTitleKey = "&s="
    case pageKey = "&page="
    case imbdIDKey = "&i="
    case plotKey = "&plot=full"
}
enum RequestType {
    case search(movieTitle : String,page : Int = 1)
    case detail(imbdID : String)
    
    var endPoint : String {
        switch self {
        case .search(let movieTitle, let page):
            return URLConstants.baseURL.rawValue + URLConstants.apiKey.rawValue + URLConstants.movieTitleKey.rawValue + movieTitle + URLConstants.pageKey.rawValue + page.toString
        case .detail(let imbdID):
            return URLConstants.baseURL.rawValue + URLConstants.apiKey.rawValue + URLConstants.imbdIDKey.rawValue + imbdID + URLConstants.plotKey.rawValue
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
