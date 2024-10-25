//
//  MainScreenVC.swift
//  assignment-18-movie-manager
//
//  Created by Despo on 24.10.24.
//

import UIKit

class MainScreenVC: UIViewController {
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        setupTestButton()
        view.backgroundColor = .purplePrimary
    }
    
    
//    ეს ღილაკი და მისი ყველა კონფიგურაცია ინიზიალიზაცია არის იმისთვის მხოლოდ ვინც დაიწყებს დეტალებს იქ რო გადავიდეს
    private func setupTestButton() {
        view.addSubview(button)
        
        button.setTitle("Go", for: .normal)
        button.backgroundColor = .systemBlue

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        button.addAction(UIAction(handler: { [weak self] action in
            let detailVC = DetailsVC()
            detailVC.hidesBottomBarWhenPushed = true
            
            self?.navigationController?.pushViewController(detailVC, animated: true)
        }), for: .touchUpInside)
    }

}
