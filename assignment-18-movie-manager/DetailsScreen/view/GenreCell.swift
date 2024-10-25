//
//  GenreCell.swift
//  assignment-18-movie-manager
//
//  Created by nino on 10/25/24.
//

import UIKit

class GenreCell: UICollectionViewCell {
    
    private var genreView = UIView()
    var genreLable = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        setUpGenreView()
        setUpGenreLable()
    }
    
    private func setUpGenreView() {
        contentView.addSubview(genreView)
        genreView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            genreView.topAnchor.constraint(equalTo: contentView.topAnchor),
            genreView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            genreView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            genreView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

        ])
        
        genreView.layer.cornerRadius = 20
        genreView.backgroundColor = .red
    }
    
    private func setUpGenreLable() {
        genreView.addSubview(genreLable)
        genreLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            genreLable.centerXAnchor.constraint(equalTo: genreView.centerXAnchor),
        ])
        
        genreLable.font = UIFont(name: "Mulish-Regular", size: 8)
        genreLable.textColor = .purplePrimary
        genreLable.textAlignment = .center
    }
}

