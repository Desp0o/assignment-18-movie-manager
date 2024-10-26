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
