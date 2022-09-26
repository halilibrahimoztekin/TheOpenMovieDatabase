//
//  ViewController.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 23.09.2022.
//

import UIKit
import Lottie
import SnapKit
class HomePageVC: BaseVC {

    let viewModel = HomePageVCViewModel(networkDelegate: Network())
    let collectionModel: SearchCollectionView = SearchCollectionView()

    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    private var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Write Movie Name Please"
        searchBar.showsCancelButton = true
        searchBar.showsSearchResultsButton = true
        return searchBar
    }()
    var movieTitle = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        initDelegate()
        self.view.addSubviews(searchBar, collectionView)
        registerCell()
        startAnimating(animationName: .emptyPageAnimation)
        setConstraint()
        collectionView.collectionViewLayout = createCompositionalLayout()

    }

    private func initDelegate() {
        collectionModel.delegate = self
        collectionView.delegate = collectionModel
        collectionView.dataSource = collectionModel
        viewModel.delegate = self
        searchBar.delegate = self
    }

    private func registerCell() {
        collectionView.register(HomePageCollectionViewCell.self, forCellWithReuseIdentifier: HomePageCollectionViewCell.reuseIdentifier)
    }


    func setConstraint() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(CGFloat(50))
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            let firstItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.30),
                                                   heightDimension: .fractionalHeight(1.0)))
            firstItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            let firstGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .fractionalHeight(0.5)),
                subitem: firstItem, count: 3)

            
            
            let secondItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                   heightDimension: .fractionalHeight(1.0)))
            secondItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            
            let secondGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .fractionalHeight(0.5)),
                subitem: secondItem, count: 2)

            let nestedGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .fractionalHeight(0.85)),
                subitems: [firstGroup, secondGroup])
            
            let section = NSCollectionLayoutSection(group: nestedGroup)
            
            return section

        }
        return layout
    }


    func getMovies(movieTitle: String, page: Int = 1) {
        viewModel.getSearchedMovies(movieTitle: movieTitle, page: page)
        if child?.animationView == nil {
            self.startAnimating(animationName: .loadingAnimation)
        }
        if page == 1 {
            collectionView.setContentOffset(.zero, animated: false)
        }
    }

}




//MARK: UISearchBar
extension HomePageVC: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {

    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            movieTitle = text
            self.collectionModel.removeAllMovies()
            self.collectionModel.isPagination = true
            getMovies(movieTitle: text)
            self.searchBar.endEditing(true)
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        self.searchBar.endEditing(true)
    }

}

//MARK: HomePageVCViewModelDelegate
extension HomePageVC: HomePageVCViewModelDelegate {
    func didMovieLoadingFinished(model: MovieSearchModel) {
        self.collectionModel.update(model: model)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.stopAndHideAnimation()
            self.collectionView.reloadData()
        }
    }

    func didErrorMovieLoading(error: CustomError) {
        DispatchQueue.main.async {
            self.stopAndHideAnimation()
            self.collectionView.setContentOffset(.zero, animated: false)
            self.collectionModel.isPagination = false
            AlertManager.shared.showAlert(title: "Warning".uppercased(), message: error.message.uppercased(), containerVC: self)
        }
       
    }
}

//MARK: SearchCollectionViewOutPut
extension HomePageVC: SearchCollectionViewOutPut {
    func loadMoreData(index: Int) {
        getMovies(movieTitle: movieTitle, page: index)
    }

    func onSelected(movie: Movies) {

    }
}
