//
//  CardViewController.swift
//  GreatCardGame
//
//  Created by Christopher Olsen on 4/6/19.
//  Copyright © 2019 Christopher Olsen. All rights reserved.
//

import UIKit

protocol ShowCardViewControllerDelegate: AnyObject {
    func didDismiss(withCard card: Card)
}

class ShowCardViewController: UIViewController {

    let drawnCard: Card

    let cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let dismissButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.backgroundColor = .purple
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitle("Great!", for: .normal)
        return button
    }()

    weak var delegate: ShowCardViewControllerDelegate?
    
    init(card: Card) {
        self.drawnCard = card
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        view.backgroundColor = .white

        view.addSubview(dismissButton)
        view.addSubview(cardImageView)
        
        dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            cardImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cardImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            cardImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            cardImageView.bottomAnchor.constraint(equalTo: dismissButton.topAnchor, constant: -16),
            
            dismissButton.heightAnchor.constraint(equalToConstant: 44),
            dismissButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            dismissButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            dismissButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])

        guard let imageName = drawnCard.imageName else { return }
        let cardImage = UIImage(named: imageName)
        cardImageView.image = cardImage
    }

    @objc private func dismissView() {
        dismiss(animated: true) {
            self.delegate?.didDismiss(withCard: self.drawnCard)
        }
    }
}
