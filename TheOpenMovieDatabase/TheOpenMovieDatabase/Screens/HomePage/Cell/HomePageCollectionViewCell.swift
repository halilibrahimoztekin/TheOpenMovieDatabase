//
//  HomePageCollectionViewCell.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 25.09.2022.
//

import UIKit

class HomePageCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "HomePageCollectionViewCell"

    private var container: UIView = {
        let view = BaseContainer(frame: .zero)
        return view
    }()

    private let movieNameLbl: UILabel = {
        let label = BaseHeaderLabel()
        return label
    }()

    private let imageView: UIImageView = {
        let imageView = BaseImageViewComponent(frame: .zero)
        return imageView
    }()


    private let typeLbl: UILabel = {
        let label = BaseLabelWithBackground()
        return label
    }()

    private let yearLbl: UILabel = {
        let label = BaseLabelWithBackground()
        return label
    }()

    private let stackView: UIStackView = {
        let stackView = BaseStackView(frame: .zero)
        return stackView
    }()

    func configure(movie: Movies) {
        addSubview(container)

        self.container.addSubviews(movieNameLbl, imageView, stackView)
        stackView.addSubviews(typeLbl, yearLbl)
        configureSnapKit()

        self.movieNameLbl.text = movie.title ?? ""
        self.imageView.setImage(with: movie.poster ?? "")
        self.typeLbl.text = movie.type ?? ""
        let year = movie.year ?? ""
        self.yearLbl.text = year.prefix(4).description

    }

    private func configureSnapKit() {
        let height = self.contentView.bounds.height
        container.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(CGFloat(height * 0.65))
        }

        stackView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(CGFloat(height * 0.13))
        }

        yearLbl.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2.1)
            make.height.equalToSuperview().dividedBy(1.5)
        }
        typeLbl.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2.1)
            make.height.equalToSuperview().dividedBy(1.5)
        }
        movieNameLbl.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-5)
        }

    }
}
