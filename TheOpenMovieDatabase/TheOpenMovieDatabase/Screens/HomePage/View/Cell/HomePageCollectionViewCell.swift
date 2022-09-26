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
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.cornerRadius = 10
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let movieNameLbl: UILabel = {
        let label = UILabel()
        label.textColor = .darkPrimaryColor
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 17.0)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        
        return label
    }()

   private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        imageView.contentMode = .scaleToFill
        return imageView
    }()


    private let typeLbl: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.layer.cornerRadius = 15
        label.layer.backgroundColor = UIColor.primaryColor?.cgColor
        label.font = UIFont.systemFont(ofSize: 13)

        return label
    }()

    private let yearLbl: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.layer.cornerRadius = 15
        label.layer.backgroundColor = UIColor.primaryColor?.cgColor
        label.font = UIFont.systemFont(ofSize: 13)

        return label
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    func configure(movie: Movies) {
        addSubview(container)

        self.container.addSubviews(movieNameLbl, imageView,stackView)
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
        let width = self.contentView.bounds.width
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
