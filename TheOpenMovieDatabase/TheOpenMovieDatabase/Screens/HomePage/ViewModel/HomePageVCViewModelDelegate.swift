//
//  ViewControllerViewModelDelegate.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 23.09.2022.
//

import Foundation

protocol HomePageVCViewModelDelegate : AnyObject {
    func didMovieLoadingFinished(model : MovieSearchModel)
    func didErrorMovieLoading(error : CustomError)
}
