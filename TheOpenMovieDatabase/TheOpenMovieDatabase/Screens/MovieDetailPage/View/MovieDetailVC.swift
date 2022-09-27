//
//  MovieDetailVC.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 26.09.2022.
//

import UIKit
enum DetailPageSections : String, CaseIterable {
    case image = "image"
    case title = "Title"
    case ratings = "Ratings"
    case imbdVotes = "IMBD Votes"
    case year = "Year"
    case released = "Released"
    case runtime = "Runtime"
    case genre = "Genre"
    case plot = "Plot"
    case actors = "Actors"
    case director = "Director"
    case writer = "Writer"
    case country = "Country"
    case awards = "Awards"
    
}
class MovieDetailVC: BaseVC {
   

    let viewModel = DetailViewControllerViewModel(networkDelegate: Network())
    let collectionModel: DetailDataSource = DetailDataSource()
    let movieId: String
    init(movieId: String) {
        self.movieId = movieId
        super.init(nibName: nil, bundle: nil)
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(collectionView)
        initDelegate()
        registerCell()
        startAnimating(animationName: .loadingAnimation)
        setConstraint()
        viewModel.getMovieDetail(imbdID: movieId)

    }
    private func registerCell() {
        collectionView.register(DetailFullImageCell.self, forCellWithReuseIdentifier: DetailFullImageCell.reuseIdentifier)
        collectionView.register(DetailFeatureCollectionCell.self, forCellWithReuseIdentifier: DetailFeatureCollectionCell.reuseIdentifier)
        collectionView.register(DetailOnlyTextCell.self, forCellWithReuseIdentifier: DetailOnlyTextCell.reuseIdentifier)
    }
    private func initDelegate() {
        collectionView.delegate = collectionModel
        collectionView.dataSource = collectionModel
        viewModel.delegate = self
    }

    func setConstraint() {

        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    func createSection() -> [DetailPageSections] {
        let values: [DetailPageSections] = DetailPageSections.allCases.map { $0 }
        return values
    }
   
}


extension MovieDetailVC: MovieDetailPageVMDelegate {
    func didFinishedLoadingMovie(movieDetail: MovieDetailModel) {
        let sections = createSection()
        collectionModel.update(sections: sections, movieDetail: movieDetail)
        
        DispatchQueue.main.async {
            self.stopAndHideAnimation()
            self.collectionView.reloadData()
        }
    }

    func didErrorLoadingMovies(error: CustomError) {

    }
}
