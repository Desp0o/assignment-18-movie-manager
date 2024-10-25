//
//  TableViewCell.swift
//  assignment-18-movie-manager
//
//  Created by Despo on 25.10.24.
//

import UIKit

class TableViewCell: UITableViewCell {
    private let poster = UIImageView()
    private let title = UILabel()
    private let imdb = UILabel()
    private let duration = UILabel()
    private let cellStack = UIStackView()
    private let movieInfoStack = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        setupCellMainStack()
        setupPoster()
        setupMovieInfoStack()
    }
    
    private func setupCellMainStack() {
        contentView.addSubview(cellStack)
        
        cellStack.translatesAutoresizingMaskIntoConstraints = false
        cellStack.isLayoutMarginsRelativeArrangement = true
        cellStack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        
        NSLayoutConstraint.activate([
            cellStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupPoster() {
        cellStack.addArrangedSubview(poster)
        cellStack.spacing = 16
        
        poster.translatesAutoresizingMaskIntoConstraints = false
        poster.layer.masksToBounds = true
        poster.layer.cornerRadius = 8
        
        NSLayoutConstraint.activate([
            poster.widthAnchor.constraint(equalToConstant: 85),
            poster.heightAnchor.constraint(equalToConstant: 128)
        ])
    }
    
    private func setupMovieInfoStack() {
        cellStack.addArrangedSubview(movieInfoStack)
        
        movieInfoStack.translatesAutoresizingMaskIntoConstraints = false
        movieInfoStack.isLayoutMarginsRelativeArrangement = true
        movieInfoStack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0)
        
        movieInfoStack.axis = .vertical
        movieInfoStack.spacing = 8
        movieInfoStack.distribution = .fill
        
        movieInfoStack.addArrangedSubview(title)
        
        let imdbStack = generateStackWithIcon(iconName: "ratingStar", uiLabel: imdb)
        movieInfoStack.addArrangedSubview(imdbStack)
        
        let durationStack = generateStackWithIcon(iconName: "durationIcon", uiLabel: duration)
        movieInfoStack.addArrangedSubview(durationStack)
    }
    
    private func setupIMDb() {
        let stack = UIStackView()
        let icon = UIImageView()
        
        movieInfoStack.addArrangedSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .center
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "ratingStar")
        
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: 12),
            icon.heightAnchor.constraint(equalToConstant: 12)
        ])
        
        stack.addArrangedSubview(icon)
        stack.addArrangedSubview(imdb)
        
    }
    
    private func generateStackWithIcon(iconName: String, uiLabel: UILabel) -> UIStackView {
        let stack = UIStackView()
        let icon = UIImageView()

        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .center
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: iconName)
        
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: 12),
            icon.heightAnchor.constraint(equalToConstant: 12)
        ])
        
        stack.addArrangedSubview(icon)
        stack.addArrangedSubview(uiLabel)
        
        return stack
    }
    
    
    func configureTbaleViewCell(currentMovie: Movie_Model) {
        self.poster.image = UIImage(named: currentMovie.poster)
        self.title.configureMovieTitle(with: currentMovie.title)
        self.imdb.configureSeocndaryText(with: "\(currentMovie.imdb)/10 IMDb")
        self.duration.configureSeocndaryText(with: currentMovie.duration)
    }
    
}
