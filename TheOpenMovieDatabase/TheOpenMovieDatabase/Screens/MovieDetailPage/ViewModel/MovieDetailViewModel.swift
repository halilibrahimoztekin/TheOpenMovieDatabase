//
//  MovieDetailViewModel.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 25.09.2022.
//

import Foundation
import FirebaseAnalytics

class DetailViewControllerViewModel {
    weak var delegate: MovieDetailPageVMDelegate?
    private let networkDelegate: NetworkDelegate

    init(networkDelegate: NetworkDelegate) {
        self.networkDelegate = networkDelegate
    }

    func getMovieDetail(imbdID: String) {
        networkDelegate.request(with: .detail(imbdID: imbdID)) { [weak self] (response: Result<MovieDetailModel, CustomError>) in
            guard let self = self else { return }
            switch response {
            case .success(let success):
                self.delegate?.didFinishedLoadingMovie(movieDetail: success)
            case .failure(let failure):
                self.delegate?.didErrorLoadingMovies(error: failure)
            }
        }
    }

    func createSection() -> [DetailPageSections] {
        let values: [DetailPageSections] = DetailPageSections.allCases.map { $0 }
        return values
    }
}
