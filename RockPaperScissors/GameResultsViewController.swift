//
//  GameResultsViewController.swift
//  RockPaperScissors
//
//  Created by Roni Rozenblat on 5/1/15.
//  Copyright (c) 2015 DINA TECHNOLOGIES. All rights reserved.
//

import UIKit

class GameResultsViewController: UIViewController {

    @IBOutlet weak var gameResultsImage: UIImageView!
    @IBOutlet weak var gameResultsLabel: UILabel!
    @IBOutlet weak var playAgainBtn: UIButton!
    
    var gameResultLabelVal: String?
    var gameResultImageVal: String?
    
    override func viewWillAppear(animated: Bool) {
        self.gameResultsLabel.text = gameResultLabelVal
        self.gameResultsImage.image = UIImage(named: gameResultImageVal!)
    }
    
    @IBAction func resetGame(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
