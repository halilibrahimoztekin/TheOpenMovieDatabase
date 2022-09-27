//
//  MovieDetailVC.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 26.09.2022.
//

import UIKit
import FirebaseAnalytics
enum DetailPageSections : String, CaseIterable {
    case image = "image"
    case title = "Title"
    case imbdVotes = "IMBD Votes"
    case ratings = "Ratings"
    case year = "Year"
    case runtime = "Runtime"
    case released = "Released"
    case genre = "Genre"
    case plot = "Plot"
    case actors = "Actors"
    case director = "Director"
    case writer = "Writer"
    case country = "Country"
    case awards = "Awards"
    
}
class MovieDetailVC: BaseVC {
   

    private let viewModel = DetailViewControllerViewModel(networkDelegate: Network())
    private let dataSource: DetailDataSource = DetailDataSource()
    private let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    let movieId: String
    
    init(movieId: String) {
        self.movieId = movieId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


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
        collectionView.delegate = dataSource
        collectionView.dataSource = dataSource
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
        dataSource.update(sections: sections, movieDetail: movieDetail)
      
        DispatchQueue.main.async {
            self.stopAndHideAnimation()
            self.collectionView.reloadData()
        }
    }

    func didErrorLoadingMovies(error: CustomError) {
        DispatchQueue.main.async {
            self.stopAndHideAnimation()
            AlertManager.shared.showAlert(title: "Warning".uppercased(), message: error.message.uppercased())
        }
        
    }
}
