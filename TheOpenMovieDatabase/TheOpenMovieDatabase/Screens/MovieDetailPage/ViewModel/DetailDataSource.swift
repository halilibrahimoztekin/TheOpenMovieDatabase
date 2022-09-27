//
//  DetailDataSource.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 26.09.2022.
//

import Foundation
import UIKit

protocol DetailDataSourceInput {
    func update(sections: [DetailPageSections], movieDetail: MovieDetailModel)
}


class DetailDataSource : NSObject {
    private var sections : [DetailPageSections] = []
    private var movieDetail : MovieDetailModel?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let movieDetail = movieDetail,!sections.isEmpty {
            switch sections[indexPath.row] {
            case .image:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailFullImageCell.reuseIdentifier, for: indexPath) as! DetailFullImageCell
                cell.configureCell(imageLink: movieDetail.poster ?? "")
                return cell
            case .ratings:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailFeatureCollectionCell.reuseIdentifier, for: indexPath) as! DetailFeatureCollectionCell
                cell.configure(title: sections[indexPath.row].rawValue, description: movieDetail.imdbRating ?? "")
                return cell
            case .title:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailOnlyTextCell.reuseIdentifier, for: indexPath) as! DetailOnlyTextCell
                cell.configureCell(text: movieDetail.title ?? "")
                return cell
            case .year:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailFeatureCollectionCell.reuseIdentifier, for: indexPath) as! DetailFeatureCollectionCell
                cell.configure(title: sections[indexPath.row].rawValue, description: movieDetail.year ?? "")
                return cell
            case .released:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailFeatureCollectionCell.reuseIdentifier, for: indexPath) as! DetailFeatureCollectionCell
                cell.configure(title: sections[indexPath.row].rawValue, description: movieDetail.released ?? "")
                return cell
            case .runtime:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailFeatureCollectionCell.reuseIdentifier, for: indexPath) as! DetailFeatureCollectionCell
                cell.configure(title: sections[indexPath.row].rawValue, description: movieDetail.runtime ?? "")
                return cell
            case .genre:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailFeatureCollectionCell.reuseIdentifier, for: indexPath) as! DetailFeatureCollectionCell
                cell.configure(title: sections[indexPath.row].rawValue, description: movieDetail.genre ?? "")
                return cell
            case .actors:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailFeatureCollectionCell.reuseIdentifier, for: indexPath) as! DetailFeatureCollectionCell
                cell.configure(title: sections[indexPath.row].rawValue, description: movieDetail.actors ?? "")
                return cell
            case .plot:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailOnlyTextCell.reuseIdentifier, for: indexPath) as! DetailOnlyTextCell
                cell.configureCell(text: movieDetail.plot ?? "")
                return cell
            case .director:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailFeatureCollectionCell.reuseIdentifier, for: indexPath) as! DetailFeatureCollectionCell
                cell.configure(title: sections[indexPath.row].rawValue, description: movieDetail.director ?? "")
                return cell
            case .writer:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailFeatureCollectionCell.reuseIdentifier, for: indexPath) as! DetailFeatureCollectionCell
                cell.configure(title: sections[indexPath.row].rawValue, description: movieDetail.writer ?? "")
                return cell
            case .country:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailFeatureCollectionCell.reuseIdentifier, for: indexPath) as! DetailFeatureCollectionCell
                cell.configure(title: sections[indexPath.row].rawValue, description: movieDetail.country ?? "")
                return cell
            case .awards:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailFeatureCollectionCell.reuseIdentifier, for: indexPath) as! DetailFeatureCollectionCell
                cell.configure(title: sections[indexPath.row].rawValue, description: movieDetail.awards ?? "")
                return cell
            case .imbdVotes:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailFeatureCollectionCell.reuseIdentifier, for: indexPath) as! DetailFeatureCollectionCell
                cell.configure(title: sections[indexPath.row].rawValue, description: movieDetail.imdbVotes ?? "")
                return cell
            }
        }
        else {
            return UICollectionViewCell()
        }
        
 
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let movieDetail = movieDetail,!sections.isEmpty {
            switch sections[indexPath.row] {
            case .image:
                return CGSize(width: UIScreen.width*0.9, height: UIScreen.height*0.4)
            case .title:
                return CGSize(width: UIScreen.width*0.95, height: 30)
            case .plot:
                return CGSize(width: UIScreen.width*0.95, height: 200)
            case .director,.country,.writer,.awards:
                return CGSize(width: UIScreen.width*0.95, height: 35)
            case .actors:
                return CGSize(width: UIScreen.width*0.95, height: 55)
            default:
                return CGSize(width: UIScreen.width*0.45, height: 30)
            }
        }
        else {
            return CGSize(width: 0, height: 0)
        }
     
    }
    
}
extension DetailDataSource : UICollectionViewDelegate,UICollectionViewDataSource {}
extension DetailDataSource : UICollectionViewDelegateFlowLayout {}
extension DetailDataSource : DetailDataSourceInput {
    func update(sections: [DetailPageSections], movieDetail: MovieDetailModel) {
        self.sections = sections
        self.movieDetail = movieDetail
    }
}
