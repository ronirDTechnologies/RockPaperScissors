//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Roni Rozenblat on 4/30/15.
//  Copyright (c) 2015 DINA TECHNOLOGIES. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rockBtn: UIButton!
    @IBOutlet weak var scissorBtn: UIButton!
    @IBOutlet weak var paperBtn: UIButton!
    let rockValue = 1
    let paperValue = 2
    let scissorValue = 3
    var resultImage: String!
    var resultLabel: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if ((segue.identifier == "showGameResult") || (segue.identifier == "scissorSegue"))
        {
            if segue.identifier == "scissorSegue"
            {
                scissorChoice()
            }
            
            let controller = segue.destinationViewController as GameResultsViewController
            controller.gameResultLabelVal = self.resultLabel
            controller.gameResultImageVal = self.resultImage
        }
    }
    
    // Code
    @IBAction func rockChoice(sender: UIButton) {
        
        let iphoneGenVal = generateRandomSelection()
        
        // If the iphone generates a rock its a tie
        if (iphoneGenVal == rockValue)
        {
            resultLabel = "Its a Tie"
            resultImage = "Tie"
        }
        // Scissor val loses to rock val
        else if (iphoneGenVal == scissorValue)
        {
            resultLabel = "Rock Beats Scissor!!!!!"
            resultImage = "RockCrushesScissors"
        }
        // Paper val beats rock val
        else if (iphoneGenVal == paperValue)
        {
            resultLabel = "Paper Beats Rock!!!!!!"
            resultImage = "PaperCoversRock"
        }
        else
        {
            println("Number generated does not correspond to a value assigned to an object \(iphoneGenVal)")
        }
        
        var controller: GameResultsViewController
        
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("gameResultsController") as GameResultsViewController
        controller.gameResultLabelVal = resultLabel
        controller.gameResultImageVal = resultImage
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
    // Code & Segue
    @IBAction func paperChoice(sender: UIButton) {
        
        let iphoneGenVal = generateRandomSelection()
        
        
         // If the iphone generates a paper value , then its a tie.
        if(iphoneGenVal == paperValue)
        {
            resultLabel = "Its a Tie"
            resultImage = "Tie"
        }
       // If the iphone generates a rock value paper wins
        else if (iphoneGenVal == rockValue)
        {
            resultLabel = "Paper Beats Rock!!!!!!"
            resultImage = "PaperCoversRock"
            
        }
        // If the iphone generates a scissorValue, then the computer wins.
        else if(iphoneGenVal == scissorValue)
        {
            resultLabel = "Scissors Beats Paper!!!!!"
            resultImage = "ScissorsCutPaper"
            
        }
        else
        {
            println("Number generated does not correspond to a value assigned to an object \(iphoneGenVal)")
        }
        
        performSegueWithIdentifier("showGameResult", sender: self)
    }
    
    
    // Segue
    func scissorChoice() {
        let iphoneGenVal = generateRandomSelection()
        
        // If the iphone generates a scissor value , then its a tie.
        if(iphoneGenVal == scissorValue)
        {
            resultLabel = "Its a Tie"
            resultImage = "Tie"
        }
            // If the iphone generates a rock value scissor loses
        else if (iphoneGenVal == rockValue)
        {
            resultLabel = "Rock Beats Scissors!!!!!!"
            resultImage = "RockCrushesScissors"
            
        }
            // If the iphone generates a scissorValue, then the computer wins.
        else if(iphoneGenVal == paperValue)
        {
            resultLabel = "Scissors Beats Paper!!!!!"
            resultImage = "ScissorsCutPaper"
            
        }
        else
        {
            println("Number generated does not correspond to a value assigned to an object \(iphoneGenVal)")
        }
        
    }
    
    func generateRandomSelection() -> Int
    {
        // Generate a random Int32 using arc4Random from 1 to 3
        let randomPlay = 1 + arc4random() % 3
        
        // Return a more convenient Int, initialized with the random value
        return Int(randomPlay)

    }
}

