//
//  DetailsVC.swift
//  assignment-18-movie-manager
//
//  Created by Despo on 25.10.24.
//

import UIKit

var genre = ["ksadb", "dsadbh", "asghdv", "adsda", "ksadიჯჯოიჯოჯოb", "dsadbh", "asghdv", "adsda"]

final class DetailsVC: UIViewController {
    private let navigationView = UIStackView()
    private let customBackButton = UIButton()
    private var backDropImage = UIImageView()
    private let movieDetailsView = UIView()
    private let backButton = UIButton()
    private let viewForTitleFavRanking = UIView()
    private let titleLable = UILabel()
    private let saveButton = UIButton()
    private let viewForIMDB = UIView()
    private let starSign = UIImageView()
    private let imbdLable = UILabel()
    
    var collecrionViewForGenre: UICollectionView = {
        let collection: UICollectionView
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.minimumLineSpacing = 8
        collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupCustomNavigation()
        setupCustomBackButton()
        setUpbackDropImageView()
        setUpmovieDetailsView()
        setUpBackButton()
        setUpviewForTitleFavRanking()
        setUpTitleLable()
        setUpSaveButton()
        setUpViewForIMDB()
        setUpImageView()
        setUpimdbLable()
        setUpcollecrionViewForGenre()
    }
    
    private func setUpbackDropImageView() {
        view.addSubview(backDropImage)
        backDropImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backDropImage.topAnchor.constraint(equalTo: view.topAnchor),
            backDropImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            backDropImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            backDropImage.heightAnchor.constraint(lessThanOrEqualToConstant: 300)
        ])
        
        backDropImage.image = UIImage(named: "spidermanBackdrop")
    }
    
    private func setUpmovieDetailsView() {
        view.addSubview(movieDetailsView)
        movieDetailsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieDetailsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 240),
            movieDetailsView.rightAnchor.constraint(equalTo: view.rightAnchor),
            movieDetailsView.leftAnchor.constraint(equalTo: view.leftAnchor),
            movieDetailsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        movieDetailsView.backgroundColor = .white
        movieDetailsView.layer.cornerRadius = 10
    }
    
    private func setUpBackButton() {
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor, multiplier: 1.0)
        ])
        
        backButton.imageView?.contentMode = .scaleToFill
        backButton.setImage(UIImage(named: "BackIcon"), for: .normal)
        
        backButton.addAction(UIAction(handler: { [weak self] action in
            self?.navigationController?.popViewController(animated: true)
        }), for: .touchUpInside)
    }
    
    private func setUpviewForTitleFavRanking() {
        movieDetailsView.addSubview(viewForTitleFavRanking)
        viewForTitleFavRanking.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewForTitleFavRanking.topAnchor.constraint(equalTo: movieDetailsView.topAnchor, constant: 24),
            viewForTitleFavRanking.leftAnchor.constraint(equalTo: movieDetailsView.leftAnchor, constant: 24),
            viewForTitleFavRanking.rightAnchor.constraint(equalTo: movieDetailsView.rightAnchor, constant: -24)
        ])
    }
    
    private func setUpTitleLable() {
        viewForTitleFavRanking.addSubview(titleLable)
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: viewForTitleFavRanking.topAnchor),
            titleLable.leftAnchor.constraint(equalTo: viewForTitleFavRanking.leftAnchor),
            titleLable.widthAnchor.constraint(lessThanOrEqualToConstant: 198)
        ])

        titleLable.text = "Spiderman: No Way Home"
        titleLable.font = UIFont(name: "Mulish-Bold", size: 25)
        titleLable.numberOfLines = 0
    }
    
    private func setUpSaveButton() {
        viewForTitleFavRanking.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        let saveImage = UIImage(named: "bookmarkInactive")?.withRenderingMode(.alwaysTemplate)
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: viewForTitleFavRanking.topAnchor),
            saveButton.rightAnchor.constraint(equalTo: viewForTitleFavRanking.rightAnchor),
            saveButton.leftAnchor.constraint(equalTo: viewForTitleFavRanking.rightAnchor, constant: 105),
            saveButton.heightAnchor.constraint(equalToConstant: 24),
            saveButton.widthAnchor.constraint(equalTo: saveButton.heightAnchor, multiplier: 1.0)
        ])
        
        saveButton.setImage(saveImage, for: .normal)
        saveButton.imageView?.tintColor = .black
    }
    
    private func setUpViewForIMDB() {
        viewForTitleFavRanking.addSubview(viewForIMDB)
        viewForIMDB.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewForIMDB.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 8),
            viewForIMDB.bottomAnchor.constraint(equalTo: viewForTitleFavRanking.bottomAnchor),
            viewForIMDB.leftAnchor.constraint(equalTo: viewForTitleFavRanking.leftAnchor)
        ])
    }
    
    private func setUpImageView() {
        viewForIMDB.addSubview(starSign)
        starSign.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            starSign.leftAnchor.constraint(equalTo: viewForIMDB.leftAnchor),
            starSign.centerYAnchor.constraint(equalTo: viewForIMDB.centerYAnchor),
            starSign.heightAnchor.constraint(equalToConstant: 12),
            starSign.widthAnchor.constraint(equalTo: starSign.heightAnchor, multiplier: 1.0)
        ])
        
        starSign.image = UIImage(named: "ratingStar")
    }
    
    private func setUpimdbLable() {
        viewForIMDB.addSubview(imbdLable)
        imbdLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imbdLable.leftAnchor.constraint(equalTo: starSign.rightAnchor, constant: 1.5),
            imbdLable.centerYAnchor.constraint(equalTo: viewForIMDB.centerYAnchor),
        ])
        
        imbdLable.text = "9.1/10 IMDb"
        imbdLable.font = UIFont(name: "Mulish-Regular", size: 12)
        imbdLable.textColor = .secondarytext
    }
    
    private func setUpcollecrionViewForGenre() {
        view.addSubview(collecrionViewForGenre)
        
        NSLayoutConstraint.activate([
            collecrionViewForGenre.topAnchor.constraint(equalTo: viewForTitleFavRanking.bottomAnchor, constant: 16),
            collecrionViewForGenre.leadingAnchor.constraint(equalTo: viewForTitleFavRanking.leadingAnchor),
            collecrionViewForGenre.trailingAnchor.constraint(equalTo: viewForTitleFavRanking.trailingAnchor),
            collecrionViewForGenre.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        collecrionViewForGenre.register(GenreCell.self, forCellWithReuseIdentifier: "GenreCell")
        collecrionViewForGenre.dataSource = self
    }
    
    private func setupCustomNavigation() {
        view.addSubview(navigationView)
        
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        navigationView.isLayoutMarginsRelativeArrangement = true
        navigationView.layoutMargins = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
        
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        ])
    }
    
    private func setupCustomBackButton() {
        navigationView.addArrangedSubview(customBackButton)
        
        customBackButton.setImage(UIImage(named: "BackIcon"), for: .normal)
        customBackButton.translatesAutoresizingMaskIntoConstraints = false
        
        customBackButton.addAction(UIAction(handler: { [weak self] action in
            self?.navigationController?.popViewController(animated: true)
        }), for: .touchUpInside)
    }
}

extension DetailsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        genre.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let curGenre = genre[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCell", for: indexPath) as? GenreCell
        
        cell?.genreLable.text = curGenre
        
        return cell ?? UICollectionViewCell()
    }
}

#Preview {
    DetailsVC()
}
