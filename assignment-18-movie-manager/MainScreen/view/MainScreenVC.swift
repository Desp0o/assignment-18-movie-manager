//
//  MainScreenVC.swift
//  assignment-18-movie-manager
//
//  Created by Despo on 24.10.24.
//  initial workbranch commit

import UIKit

class MainScreenVC: UIViewController {
    let viewModel = Movie_ViewModel()
    let tableStack = UIStackView()
    let popularTitle = UILabel()
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    let viewTitleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "MovieMan"
        title.font = UIFont(name: "Merriweather-Black", size: 16)
        title.textAlignment = .center
        title.textColor = .darkBlue
        return title
    }()
    
    let currentMovieTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Now Showing"
        title.font = UIFont(name: "Merriweather-Black", size: 16)
        title.textColor = .darkBlue
        return title
    }()
    
    let currentMoviesCollectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionLayout.itemSize = CGSize(width: 143, height: 283)
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.minimumLineSpacing = 16
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor =  .white

        setupMainView()
        setupTableStack()
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
        currentMoviesCollectionView.showsHorizontalScrollIndicator = false
        currentMoviesCollectionView.dataSource = self
        currentMoviesCollectionView.delegate = self
        currentMoviesCollectionView.register(CurrentMoviesCollectionViewCell.self, forCellWithReuseIdentifier: "CurrentMoviesCollectionViewCell")
        }
    
    func configureCurrentMovieTitle() {
        view.addSubview(currentMovieTitle)
        NSLayoutConstraint.activate([
            currentMovieTitle.topAnchor.constraint(equalTo: viewTitleLabel.bottomAnchor , constant: 16),
            currentMovieTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            currentMovieTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 24),
        ])
    }
    
    func setCurrentMovieColletionView() {
        NSLayoutConstraint.activate([
            currentMoviesCollectionView.topAnchor.constraint(equalTo: currentMovieTitle.bottomAnchor, constant: 10),
            currentMoviesCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            currentMoviesCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            currentMoviesCollectionView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 283/375),
        ])
    }
}


extension MainScreenVC: UICollectionViewDataSource, UICollectionViewDelegate {
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentMovie = viewModel.singleMovie(at: indexPath.row)
        
        let vc = DetailsVC(movie: currentMovie)
        vc.hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainScreenVC: UITableViewDataSource {
    private func setupTableStack() {
        view.addSubview(tableStack)
        tableStack.translatesAutoresizingMaskIntoConstraints = false
        tableStack.axis = .vertical
        tableStack.spacing = 16
                
        NSLayoutConstraint.activate([
            tableStack.topAnchor.constraint(equalTo: currentMoviesCollectionView.bottomAnchor, constant: 300)
        ])

        setupPopularTitle()
        setupTableView()
    }
    
    private func setupPopularTitle() {
        tableStack.addArrangedSubview(popularTitle)
        
        popularTitle.configureSectionHeader(with: "Popular")
        popularTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            popularTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            popularTitle.topAnchor.constraint(equalTo: tableStack.topAnchor, constant: 0)
        ])
    }
    
    private func setupTableView() {
        tableStack.addArrangedSubview(tableView)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        
        NSLayoutConstraint.activate([
            tableStack.topAnchor.constraint(equalTo: currentMoviesCollectionView.bottomAnchor, constant: 16),
            tableStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            tableStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tableStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.popularMovie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
        let currentMovie = viewModel.popularMovie[indexPath.row]
        cell?.configureTbaleViewCell(currentMovie: currentMovie)
        
        return cell ?? UITableViewCell()
    }
}

extension MainScreenVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentMovie = viewModel.singleMovie(at: indexPath.row)
        
        let vc = DetailsVC(movie: currentMovie)
        vc.hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
