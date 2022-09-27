//
//  OnlyTextCellForDetailPage.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 27.09.2022.
//

import Foundation
import UIKit
class DetailOnlyTextCell: UICollectionViewCell {
    static var reuseIdentifier: String = "DetailOnlyTextCell"
    
    private let descriptionLabel: UILabel = {
        let label = BaseFeatureLabel(frame: .zero)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 25.0)
        return label
    }()
    
    func configureCell(text: String) {
        configureSnapKit()
        descriptionLabel.text = text
        descriptionLabel.textAlignment = .center
    }
    
    func configureSnapKit() {
        self.contentView.addSubviews(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview()
        }
    }
}
