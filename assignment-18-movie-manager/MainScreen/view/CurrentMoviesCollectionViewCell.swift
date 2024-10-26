//
//  CurrentMoviesCollectionViewCell.swift
//  assignment-18-movie-manager
//
//  Created by Giorgi Amiranashvili on 26.10.24.
//

import UIKit

class CurrentMoviesCollectionViewCell: UICollectionViewCell {
    
    var movieImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var movieNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Mulish-Bold", size: 18)
        label.numberOfLines = 2
        label.textColor = .darkBlue
        
        return label
    }()
    
    var movieRatingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Mulish-Regular", size: 12)
        label.textColor = .secondarytext
        return label
    }()
    
    let icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        configureMovieImage()
        configureMovieNameLabel()
        configureMovieRatingLabel()
        configureRatingIcon()
    }
    
    func configureMovieImage() {
        addSubview(movieImage)
        
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: topAnchor),
            movieImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            movieImage.widthAnchor.constraint(equalToConstant: 155),
            movieImage.heightAnchor.constraint(equalToConstant: 213)
        ])
        
    }
    
    func configureMovieNameLabel() {
        addSubview(movieNameLabel)
        
        NSLayoutConstraint.activate([
            movieNameLabel.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 3),
            movieNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            movieNameLabel.centerXAnchor.constraint(equalTo: movieImage.centerXAnchor),
            movieNameLabel.widthAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    func configureMovieRatingLabel() {
        addSubview(movieRatingLabel)
        
        NSLayoutConstraint.activate([
            movieRatingLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor),
            movieRatingLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 22),
            movieRatingLabel.centerXAnchor.constraint(equalTo: movieNameLabel.centerXAnchor),
            movieRatingLabel.widthAnchor.constraint(equalToConstant: 155)
        ])
    }
    
    func configureRatingIcon() {
        addSubview(icon)
        icon.image = .ratingStar
        
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: movieRatingLabel.centerYAnchor),
            icon.rightAnchor.constraint(equalTo: movieRatingLabel.leftAnchor, constant: -4),
            icon.heightAnchor.constraint(equalTo: movieRatingLabel.heightAnchor, multiplier: 1),
            icon.leftAnchor.constraint(equalTo: leftAnchor, constant: 6)
            
        ])
    }
}
