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
        setupHeaderLabel()
        setupFavouriteMoviesCollectionView()
    }
    
    private func setupHeaderLabel() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel)
        //TODO: - Configure header
        headerLabel.text = "temporary text"
        headerLabel.textAlignment = .center
        
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

        return cell
    }
}

