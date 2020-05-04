//
//  ViewController.swift
//  RileysTicTacToe
//
//  Created by Riley Worstell on 5/3/20.
//  Copyright © 2020 Riley Worstell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    func clearBoard() {
        button1.backgroundColor = UIColor.white
        button1.setTitle("", for: UIControl.State.normal)
        button1.isEnabled = true
        button2.backgroundColor = UIColor.white
        button2.setTitle("", for: UIControl.State.normal)
        button2.isEnabled = true
        button3.backgroundColor = UIColor.white
        button3.setTitle("", for: UIControl.State.normal)
        button3.isEnabled = true
        button4.backgroundColor = UIColor.white
        button4.setTitle("", for: UIControl.State.normal)
        button4.isEnabled = true
        button5.backgroundColor = UIColor.white
        button5.setTitle("", for: UIControl.State.normal)
        button5.isEnabled = true
        button6.backgroundColor = UIColor.white
        button6.setTitle("", for: UIControl.State.normal)
        button6.isEnabled = true
        button7.backgroundColor = UIColor.white
        button7.setTitle("", for: UIControl.State.normal)
        button7.isEnabled = true
        button8.backgroundColor = UIColor.white
        button8.setTitle("", for: UIControl.State.normal)
        button8.isEnabled = true
        button9.backgroundColor = UIColor.white
        button9.setTitle("", for: UIControl.State.normal)
        button9.isEnabled = true
        player1.removeAll()
        player2.removeAll()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        let buttonSelected = sender as UIButton
        print(buttonSelected.tag)
        playGame(buttonSelected: buttonSelected)
        findWinner()
        AutoPlay()
    }
    var ActivePlayer = 1
    var player1 = [Int]()
    var player2 = [Int]()
    func playGame(buttonSelected:UIButton) {
        if ActivePlayer == 1 {
            buttonSelected.setTitle("X", for: UIControl.State.normal)
            buttonSelected.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            player1.append(buttonSelected.tag)
            print(player1)
            ActivePlayer = 2
            
        } else {
            buttonSelected.setTitle("O", for: UIControl.State.normal)
            buttonSelected.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            ActivePlayer = 1
            player2.append(buttonSelected.tag)
            print(player2)
        }
        buttonSelected.isEnabled = false
        
    }
    
    func findWinner() {
        var msg = ""
        if((player1.contains(1) && player1.contains(2) && player1.contains(3)) ||
            (player1.contains(4) && player1.contains(5) && player1.contains(6)) ||
            (player1.contains(7) && player1.contains(8) && player1.contains(9)) ||
            (player1.contains(1) && player1.contains(4) && player1.contains(7)) ||
            (player1.contains(2) && player1.contains(5) && player1.contains(8)) ||
            (player1.contains(3) && player1.contains(6) && player1.contains(9)) ||
            (player1.contains(1) && player1.contains(5) && player1.contains(9)) ||
            (player1.contains(3) && player1.contains(5) && player1.contains(7))) {
            msg = "Player 1 wins"
            let alert = UIAlertController(title: "Winner", message: msg, preferredStyle: UIAlertController.Style.alert)
                 alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: {
                self.clearBoard()
            }
            )
        }
        
        if((player2.contains(1) && player2.contains(2) && player2.contains(3)) ||
            (player2.contains(4) && player2.contains(5) && player2.contains(6)) ||
            (player2.contains(7) && player2.contains(8) && player2.contains(9)) ||
            (player2.contains(1) && player2.contains(4) && player2.contains(7)) ||
            (player2.contains(2) && player2.contains(5) && player2.contains(8)) ||
            (player2.contains(3) && player2.contains(6) && player2.contains(9)) ||
            (player2.contains(1) && player2.contains(5) && player2.contains(9)) ||
            (player2.contains(3) && player2.contains(5) && player2.contains(7))) {
            msg = "Player 2 wins"
            let alert = UIAlertController(title: "Winner", message: msg, preferredStyle: UIAlertController.Style.alert)
                 alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
             self.present(alert, animated: true, completion: {
                self.clearBoard()
             })
             }
        
     
    }
    
    func AutoPlay() {
        var emptyCells = [Int]()
        for index in 1...9 {
            if !(player1.contains(index) || player2.contains(index)) {
                emptyCells.append(index)
            }
        }
        let randIndex = arc4random_uniform(UInt32(emptyCells.count))
        let cellID = emptyCells[Int(randIndex)]
        var buttonSelect: UIButton?
       
        switch cellID {
            case 1:
            buttonSelect = button1
            case 2:
            buttonSelect = button2
            case 3:
            buttonSelect = button3
            case 4:
            buttonSelect = button4
            case 5:
            buttonSelect = button5
            case 6:
            buttonSelect = button6
            case 7:
            buttonSelect = button7
            case 8:
            buttonSelect = button8
            default:
            buttonSelect = button9
        
    }
        findWinner()
        playGame(buttonSelected: buttonSelect!)
        findWinner()
}
}
