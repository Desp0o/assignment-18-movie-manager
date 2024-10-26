//
//  MainScreenVC.swift
//  assignment-18-movie-manager
//
//  Created by Despo on 24.10.24.
//

import UIKit

<<<<<<< HEAD
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white

        setupTableStack()
    }
}

extension MainScreenVC: UITableViewDataSource {
    private func setupTableStack() {
        view.addSubview(tableStack)
        tableStack.translatesAutoresizingMaskIntoConstraints = false
        
        setupPopularTitle()
        setupTableView()
    }
    
    private func setupPopularTitle() {
        view.addSubview(popularTitle)
        popularTitle.configureSectionHeader(with: "Popular")
        popularTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            popularTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            popularTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
        ])
    }
    
    private func setupTableView() {
        tableStack.addArrangedSubview(tableView)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        
        NSLayoutConstraint.activate([
            tableStack.topAnchor.constraint(equalTo: popularTitle.bottomAnchor, constant: 16),
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
        print(currentMovie)
    }
=======
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
>>>>>>> feature/main-screen-ui-update
}
