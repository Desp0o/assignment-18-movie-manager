//
//  DetailsVC.swift
//  assignment-18-movie-manager
//
//  Created by Despo on 25.10.24.
//

import UIKit

final class DetailsVC: UIViewController {
    private let navigationView = UIStackView()
    private let customBackButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        setupCustomNavigation()
        setupCustomBackButton()
    }
    
    private func setupCustomNavigation() {
        view.addSubview(navigationView)
        
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    private func setupCustomBackButton() {
        navigationView.addArrangedSubview(customBackButton)

        customBackButton.setImage(UIImage(named: "BackIcon"), for: .normal)
        customBackButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customBackButton.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor, constant: 24)
        ])
        
        customBackButton.addAction(UIAction(handler: { [weak self] action in
            self?.navigationController?.popViewController(animated: true)
        }), for: .touchUpInside)
    }
}
