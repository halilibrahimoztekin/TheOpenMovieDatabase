//
//  ViewControllerViewModel.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 23.09.2022.
//

import Foundation

class HomePageVCViewModel {
    weak var delegate: HomePageVCViewModelDelegate?
    private let networkDelegate: NetworkDelegate

    init(networkDelegate: NetworkDelegate) {
        self.networkDelegate = networkDelegate
    }

    func getSearchedMovies(movieTitle: String, page: Int = 1) {
        let movieTitle = movieTitle.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        networkDelegate.request(with: .search(movieTitle: movieTitle, page: page)) { [weak self] (response: Result<MovieSearchModel, CustomError>) in
            guard let self = self else { return }
            switch response {
            case .success(let success):
                if let response = success.response {
                    if response == "True" {
                        self.delegate?.didMovieLoadingFinished(model: success)
                    }
                    else {
                        self.delegate?.didErrorMovieLoading(error: .noMoreMovie)
                    }
                }
            case .failure(let failure):
                self.delegate?.didErrorMovieLoading(error: failure)
            }
        }
    }

}
