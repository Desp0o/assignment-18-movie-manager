//
//  MainScreenVC.swift
//  assignment-18-movie-manager
//
//  Created by Despo on 24.10.24.
//

import UIKit

class MainScreenVC: UIViewController {    
    let viewTitleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "MovieMan"
        title.font = UIFont(name: "Merriweather-Black", size: 20)
        title.textAlignment = .center
        title.textColor = .darkBlue
        return title
    }()
    
    let currentMovieTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Now Showing"
        title.font = UIFont(name: "Merriweather-Black", size: 20)
        title.textColor = .darkBlue
        return title
    }()
    
    let currentMoviesCollectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionLayout.itemSize = CGSize(width: 170, height: 243)
        collectionLayout.scrollDirection = .horizontal
        collection.backgroundColor = .white
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setupMainView()
        view.backgroundColor =  .white
    }
    
    func setupMainView() {
        configureViewTitleLabel()
        configureCurrentMovieTitle()
        configureCurrentMoviewCollectionView()
    }
    
    
    func configureViewTitleLabel() {
        view.addSubview(viewTitleLabel)
        setMainViewTitleLabel()
    }
    
    func setMainViewTitleLabel() {
        NSLayoutConstraint.activate([
            viewTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            viewTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            viewTitleLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configureCurrentMoviewCollectionView() {
        view.addSubview(currentMoviesCollectionView)
        setCurrentMovieColletionView()
        currentMoviesCollectionView.dataSource = self
        currentMoviesCollectionView.register(CurrentMoviesCollectionViewCell.self, forCellWithReuseIdentifier: "CurrentMoviesCollectionViewCell")
    }
    
    func configureCurrentMovieTitle() {
        view.addSubview(currentMovieTitle)
        NSLayoutConstraint.activate([
            currentMovieTitle.topAnchor.constraint(equalTo: viewTitleLabel.bottomAnchor , constant: 16),
            currentMovieTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            currentMovieTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 24),
            currentMovieTitle.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func setCurrentMovieColletionView() {
        NSLayoutConstraint.activate([
            currentMoviesCollectionView.topAnchor.constraint(equalTo: currentMovieTitle.bottomAnchor, constant: 16),
            currentMoviesCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            currentMoviesCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            currentMoviesCollectionView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 283/375),
            currentMoviesCollectionView.heightAnchor.constraint(equalTo: currentMoviesCollectionView.widthAnchor, multiplier: 375/283)
        ])
    }
}

extension MainScreenVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let vc = Movie_ViewModel()
        return vc.numberOfMovie
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = currentMoviesCollectionView.dequeueReusableCell(withReuseIdentifier: "CurrentMoviesCollectionViewCell", for: indexPath) as? CurrentMoviesCollectionViewCell
        
        let vc = Movie_ViewModel()
        let movie = vc.singleMovie(at: indexPath.row)
        cell?.movieImage.image = UIImage(named: movie.poster)
        cell?.movieNameLabel.text = movie.title
        cell?.movieRatingLabel.text = "\(movie.imdb)/10 IMDb"
        return cell ?? UICollectionViewCell()
    }
}
