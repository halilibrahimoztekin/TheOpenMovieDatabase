//
//  MovieDetailPageVMDelegate.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 25.09.2022.
//

import Foundation

protocol MovieDetailPageVMDelegate : AnyObject {
    func didFinishedLoadingMovie(movieDetail : MovieDetailModel)
    func didErrorLoadingMovies(error: CustomError)
}
