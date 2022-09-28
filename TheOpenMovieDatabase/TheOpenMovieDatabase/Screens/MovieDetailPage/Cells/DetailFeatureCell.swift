//
//  DetailHeaderCollectionViewCell.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 27.09.2022.
//

import UIKit

class DetailFeatureCell: UICollectionViewCell {
    static var reuseIdentifier: String = "DetailFeatureCell"
   
    private let titleLbl: UILabel = {
        let label = BaseHeaderLabel()
        return label
    }()
 
    private let descriptionLabel: UILabel = {
        let label = BaseFeatureLabel(frame: .zero)
        return label
    }()
 
    
    func configure(title: String, description : String) {
        self.contentView.addSubviews(titleLbl,descriptionLabel)
        setSnapKit()
        self.descriptionLabel.text = description
        self.titleLbl.text = "\(title):"
    }
    
    func setSnapKit() {
        titleLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.top)
            make.left.equalTo(titleLbl.snp.right).offset(5)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalTo(titleLbl.snp.bottom)
        }
    }
}

