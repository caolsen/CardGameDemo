//
//  ViewController.swift
//  GreatCardGame
//
//  Created by Christopher Olsen on 4/6/19.
//  Copyright © 2019 Christopher Olsen. All rights reserved.
//

import UIKit

class DrawACardViewController: UIViewController {

    private let ruleChecker = RuleChecker(rule: SimpleRule())
    private var deck: Deck?

    private var player = Player() {
        didSet {
            playerPointsLabel.text = "\(player.points)"
        }
    }
    
    @IBOutlet weak var drawACardButton: UIButton!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerPointsLabel: UILabel!
    
    @IBAction func drawACardButtonPressed(_ sender: UIButton) {
        drawACard()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        drawACardButton.layer.cornerRadius = drawACardButton.bounds.height / 2
        drawACardButton.backgroundColor = .purple
        drawACardButton.tintColor = .white

        playerPointsLabel.clipsToBounds = true
        playerPointsLabel.layer.cornerRadius = playerPointsLabel.bounds.height / 2
        playerPointsLabel.backgroundColor = .purple
        playerPointsLabel.textColor = .white

        deck = Deck(useSuits: Deck.defaultDeck)
        playerNameLabel.text = player.name
        playerPointsLabel.text = "\(player.points)"
    }

    private func drawACard() {
        guard let drawnCard = deck?.drawCard() else { return }
        
        let showCardViewController = ShowCardViewController(card: drawnCard)
        showCardViewController.delegate = self
        present(showCardViewController, animated: true, completion: nil)
    }

    private func calculatePoints(for card: Card) {
        player.points += ruleChecker.checkCardForPoints(card)
    }
}

extension DrawACardViewController: ShowCardViewControllerDelegate {
    func didDismiss(withCard card: Card) {
        UIView.animate(withDuration: 0.25, animations: {
            self.playerPointsLabel.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }, completion: { _ in
            UIView.animate(withDuration: 0.125) {
                self.calculatePoints(for: card)
                self.playerPointsLabel.transform = CGAffineTransform.identity
            }
        })
    }
}
