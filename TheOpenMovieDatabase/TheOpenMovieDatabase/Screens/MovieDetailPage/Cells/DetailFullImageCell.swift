//
//  ImageViewCollectionViewCell.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 26.09.2022.
//

import UIKit

class DetailFullImageCell: UICollectionViewCell {
    static var reuseIdentifier: String = "ImageViewCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = BaseImageViewComponent(frame: .zero)
        return imageView
    }()
    
    func configureCell(imageLink: String) {
        configureSnapKit()
        imageView.setImage(with: imageLink)
    }
    
    func configureSnapKit() {
        self.contentView.addSubviews(imageView)
        self.backgroundColor = .blue
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
