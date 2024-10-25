//
//  FavoriteVC.swift
//  assignment-18-movie-manager
//
//  Created by Despo on 25.10.24.
//

import UIKit
import Foundation

final class FavoriteVC: UIViewController {
    private let headerLabel = UILabel()
    private let greyBar = CALayer()
    private let favouriteMoviesCollectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical
        collectionLayout.minimumLineSpacing = 0
        collectionLayout.minimumInteritemSpacing = 0
        collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    let movieViewModel = Movie_ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        setupGreyBar()
        setupHeaderLabel()
        setupFavouriteMoviesCollectionView()
    }
    
    private func setupGreyBar() {
        view.layer.addSublayer(greyBar)
        let barWidth = view.bounds.width * 0.3
        greyBar.backgroundColor = UIColor(named: "greyBar")?.cgColor
        greyBar.frame = CGRect(x: 0, y: 0, width: barWidth, height: view.bounds.height)
    }
    
    private func setupHeaderLabel() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel)
        headerLabel.text = "Favourites"
        headerLabel.font = UIFont(name: "Merriweather-Black", size: 16)
        headerLabel.textAlignment = .center
        headerLabel.textColor = .darkBlue
        
        NSLayoutConstraint.activate([
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerLabel.heightAnchor.constraint(equalToConstant: 60),
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    private func setupFavouriteMoviesCollectionView() {
        view.addSubview(favouriteMoviesCollectionView)
        
        NSLayoutConstraint.activate([
            favouriteMoviesCollectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            favouriteMoviesCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            favouriteMoviesCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            favouriteMoviesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}

extension FavoriteVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieViewModel.numberOfMovie
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavouriteMoviesCollectionViewCell", for: indexPath) as! FavouriteMoviesCollectionViewCell
//        let currentMovie = movieViewModel.singleMovie(at: indexPath.row)
//        cell.configureCell(with: currentMovie)
        return cell
    }
}

