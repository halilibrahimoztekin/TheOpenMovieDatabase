//
//  SearchCollectionView.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 25.09.2022.
//

import Foundation
import UIKit

protocol HomePageDataSourceInput {
    func update(model : MovieSearchModel)
    func removeAllMovies()
}

protocol HomePageDataSourceOutput : AnyObject {
    func onSelected(movie: Movies)
    func loadMoreData(index : Int)
}

class HomePageDataSource : NSObject {
    weak var delegate : HomePageDataSourceOutput?
    private lazy var movies : [Movies] = []
    private var index = 1
    var isPagination = true
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePageCollectionViewCell.reuseIdentifier, for: indexPath) as! HomePageCollectionViewCell
        let movie = movies[indexPath.row]
        cell.configure(movie: movie)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.onSelected(movie: movies[indexPath.row])
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if isPagination && indexPath.row > movies.count - 2 {
            index += 1
            self.delegate?.loadMoreData(index: index)
        }
        
    }
}

extension HomePageDataSource : UICollectionViewDelegate,UICollectionViewDataSource {}

extension HomePageDataSource : HomePageDataSourceInput {
    func removeAllMovies() {
        movies.removeAll()
        index = 1
    }
    
    func update(model: MovieSearchModel) {
        if let movies = model.search {
            self.movies.append(contentsOf: movies)
        }
    }
}
