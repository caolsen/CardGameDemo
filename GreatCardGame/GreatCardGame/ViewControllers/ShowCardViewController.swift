//
//  CardViewController.swift
//  GreatCardGame
//
//  Created by Christopher Olsen on 4/6/19.
//  Copyright © 2019 Christopher Olsen. All rights reserved.
//

import UIKit

protocol ShowCardViewControllerDelegate: class {
    func didDismiss(withCard card: Card)
}

class ShowCardViewController: UIViewController {

    var drawnCard: Card!

    let cardImageView = UIImageView()
    let dismissButton = UIButton()

    weak var delegate: ShowCardViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        dismissButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        dismissButton.layer.cornerRadius = 5
        dismissButton.backgroundColor = .purple
        dismissButton.tintColor = .white
        dismissButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        dismissButton.setTitle("Great!", for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)

        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        cardImageView.bottomAnchor.constraint(equalTo: dismissButton.topAnchor, constant: -16).isActive = true
        cardImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cardImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        cardImageView.contentMode = .scaleAspectFit

        guard let imageName = drawnCard?.imageName else { return }
        let cardImage = UIImage(named: imageName)
        cardImageView.image = cardImage
    }

    @objc func dismissView() {
        dismiss(animated: true) {
            self.delegate?.didDismiss(withCard: self.drawnCard)
        }
    }
}
