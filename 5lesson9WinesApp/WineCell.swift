//
//  WineCell.swift
//  5lesson9WinesApp
//
//  Created by Aiturgan Kurmanbekova on 9/4/24.
//

import UIKit

class WineCell: UICollectionViewCell {
    static let reuseId = "wine_cell"
    
    private let wineLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let wineryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let averageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 9)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let reviewsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 9)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = .wineIcon
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(wineLabel)
        NSLayoutConstraint.activate(
            [wineLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
             wineLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
             wineLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2)
            ])
        
        addSubview(wineryLabel)
        NSLayoutConstraint.activate(
            [wineryLabel.topAnchor.constraint(equalTo: wineLabel.bottomAnchor, constant: 5),
             wineryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
             wineryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            ])
        
        addSubview(locationLabel)
        NSLayoutConstraint.activate(
            [locationLabel.topAnchor.constraint(equalTo: wineryLabel.bottomAnchor, constant: 5),
             locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
             locationLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2)
            ])
        
        addSubview(ratingStackView)
        NSLayoutConstraint.activate(
            [ratingStackView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5),
             ratingStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
             ratingStackView.widthAnchor.constraint(equalToConstant: 80),
             ratingStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            ])
        ratingStackView.addArrangedSubview(averageLabel)
        ratingStackView.addArrangedSubview(reviewsLabel)
        
        addSubview(image)
        NSLayoutConstraint.activate(
            [image.topAnchor.constraint(equalTo: topAnchor, constant: 10),
             image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
             image.widthAnchor.constraint(equalToConstant: 100),
             image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            ])
    }
    
    func setData(wine: Wine) {
        wineLabel.text = wine.wine
        wineryLabel.text = wine.winery
        locationLabel.text = wine.location
        averageLabel.text = wine.rating.average
        reviewsLabel.text = wine.rating.reviews
    }
}
