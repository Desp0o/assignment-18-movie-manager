//
//  MainScreenVC.swift
//  assignment-18-movie-manager
//
//  Created by Despo on 24.10.24.
//

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
        tableView.showsVerticalScrollIndicator = false
        
        NSLayoutConstraint.activate([
            tableStack.topAnchor.constraint(equalTo: popularTitle.bottomAnchor, constant: 16),
            tableStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            tableStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tableStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfMovie
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
        let currentMovie = viewModel.singleMovie(at: indexPath.row)
        cell?.configureTbaleViewCell(currentMovie: currentMovie)
        
        return cell ?? UITableViewCell()
    }
}
