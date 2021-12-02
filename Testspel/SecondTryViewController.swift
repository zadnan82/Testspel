//
//  SecondTryViewController.swift
//  Testspel
//
//  Created by ITHS on 2021-11-26.
//

import UIKit

class SecondTryViewController: UIViewController {
    
    @IBOutlet weak var a11: UIImageView!
    @IBOutlet weak var a22: UIImageView!
    @IBOutlet weak var a33: UIImageView!
    @IBOutlet weak var a44: UIImageView!
    @IBOutlet weak var b11: UIImageView!
    @IBOutlet weak var b22: UIImageView!
    @IBOutlet weak var b33: UIImageView!
    @IBOutlet weak var b44: UIImageView!
    @IBOutlet weak var c11: UIImageView!
    @IBOutlet weak var c22: UIImageView!
    @IBOutlet weak var c33: UIImageView!
    @IBOutlet weak var c44: UIImageView!
    @IBOutlet weak var d11: UIImageView!
    @IBOutlet weak var d22: UIImageView!
    @IBOutlet weak var d33: UIImageView!
    @IBOutlet weak var d44: UIImageView!
    @IBOutlet weak var announcementLabel2: UILabel!
    @IBOutlet weak var player1NameLabel2: UILabel!
    @IBOutlet weak var player2NameLabel2: UILabel!
    @IBOutlet weak var player1ScoreLabel2: UILabel!
    @IBOutlet weak var player2ScoreLabel2: UILabel!
    @IBOutlet weak var winnerLabel2: UILabel!
    
    @IBOutlet weak var a1: UIImageView!
    @IBOutlet weak var a2: UIImageView!
    @IBOutlet weak var a3: UIImageView!
    @IBOutlet weak var b1: UIImageView!
    @IBOutlet weak var b2: UIImageView!
    @IBOutlet weak var b3: UIImageView!
    @IBOutlet weak var c1: UIImageView!
    @IBOutlet weak var c2: UIImageView!
    @IBOutlet weak var c3: UIImageView!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var player1ScoreLabel: UILabel!
    @IBOutlet weak var player2ScoreLabel: UILabel!
    @IBOutlet weak var announcementLabel: UILabel!
    @IBOutlet weak var player1NameLabel: UILabel!
    @IBOutlet weak var player2NameLabel: UILabel!
    
    var player1 : Bool = false
    var player2 : Bool = false
    var number = 0
    //var player1list = [Int]()
    //var player2list = [Int]()
    var player1Score = 0
    var player2Score = 0
    var winner = ""
    var pName1 = "Player 1"
    var pName2 = "Player 2"
    var choice = ""
    
    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if choice == "3 X 3" {
            player1NameLabel.text = pName1
            player2NameLabel.text = pName2
        } else {
       
        player1NameLabel2.text = pName1
        player2NameLabel2.text = pName2
        }
        randomplayer()
    }
      
    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
 
        guard let imageView = sender.view as? UIImageView else { return }
          
        let imageLocation = imageView.tag
            
        if game.canplay(imageLocation: imageLocation) {
            
            if player1 == true {
                imageView.image = UIImage(named: "xsign")
                player1 = false ; player2 = true
                game.addToPlayer1List(imageLocation: imageLocation)
                if choice == "3 X 3"{
                    if game.check3Winner1(player1: player1) {
                        player1Check()
                    }
                   if game.checkDraw3(){
                        winnerLabel.text = "No one gets a point!"
                        winner = "NO" 
                    }
                return
                }
                
                else if game.check4Winner1(player1: player1) {
                    player1Check()
                    }
                if game.checkDraw4() {
                    winnerLabel2.text = "No one gets a point!"
                    winner = "NO"
                }
                    return }
            
            
              else  if player2 == true {
                    imageView.image = UIImage(named: "osign")
                  player2 = false ; player1 = true
                    game.addToPlayer2List(imageLocation: imageLocation)
                  if choice == "3 X 3"{
                  if game.check3Winner2(player2: player2) {
                  player2Check()
                  }
                      if game.checkDraw3(){
                           winnerLabel.text = "No one gets a point!"
                           winner = "NO"
                       }
                  return
                  }
                  
                  else if game.check4Winner2(player2: player2) {
                      player2Check()
                      }
            if game.checkDraw4(){
                 winnerLabel.text = "No one gets a point!"
                 winner = "NO"
             }
         return
         }
    }
    
}



    func player1Check(){
        if choice == "3 X 3"{
        winnerLabel.text = "\(pName1) gets a point!"
        player1Score += 1
        player1ScoreLabel.text = String(player1Score)
        winner = pName1
        deactivePlayers()
        return
        } else {
            winnerLabel2.text = "\(pName1) gets a point!"
            player1Score += 1
            player1ScoreLabel2.text = String(player1Score)
            winner = pName1
            deactivePlayers()
            return
        }
    }
    
    func player2Check(){
        if choice == "3 X 3"{
        winnerLabel.text = "\(pName2) gets a point!"
        player2Score += 1
        player2ScoreLabel.text = String(player2Score)
        winner = pName2
        deactivePlayers()
        return
        } else {
            winnerLabel2.text = "\(pName2) gets a point!"
            player2Score += 1
            player2ScoreLabel2.text = String(player2Score)
            winner = pName2
            deactivePlayers()
            return
        }
        }
    
    func randomplayer() {
        if choice == "3 X 3" {
            number = Int.random(in: 1..<3)
            if number == 1 {
                player1 = true ; player2 = false
                announcementLabel.text = "\(pName1) X will start playing"
                return
            } else {
                player2 = true ; player1 = false
                announcementLabel.text = "\(pName2) O will start playing"
                return
            }
        } else {
            number = Int.random(in: 1..<3)
            if number == 1 {
                player1 = true ; player2 = false
                announcementLabel2.text = "\(pName1) X will start playing"
                return
            } else {
                player2 = true ; player1 = false
                announcementLabel2.text = "\(pName2) O will start playing"
                return
            }
        }
    }
    
    func deactivePlayers(){
        player1 = false ; player2 = false
    }
    
    @IBAction func playAgain(_ sender: Any) {
        game.clearLists()
        
        if choice == "3 X 3" {
            a1.image = UIImage(named: "") ; a2.image = UIImage(named: "")
            a3.image = UIImage(named: "") ; b1.image = UIImage(named: "")
            b2.image = UIImage(named: "") ; b3.image = UIImage(named: "")
            c1.image = UIImage(named: "") ; c2.image = UIImage(named: "")
            c3.image = UIImage(named: "")
        winnerLabel.text = ""
        if winner == "NO" {
            randomplayer()
        } else if winner == pName1 {
            announcementLabel.text = ("\(winner) X will start now")
            player1 = true
            winnerLabel.text = " "
        } else  if winner == pName2 {
            announcementLabel.text = ("\(winner) O will start now")
            player2 = true
            winnerLabel.text = " "
        }
        } else {
            a11.image = UIImage(named: ""); a22.image = UIImage(named: "")
            a33.image = UIImage(named: ""); a44.image = UIImage(named: "")
            b11.image = UIImage(named: ""); b22.image = UIImage(named: "")
            b33.image = UIImage(named: ""); b44.image = UIImage(named: "")
            c11.image = UIImage(named: ""); c22.image = UIImage(named: "")
            c33.image = UIImage(named: ""); c44.image = UIImage(named: "")
            d11.image = UIImage(named: ""); d22.image = UIImage(named: "")
            d33.image = UIImage(named: ""); d44.image = UIImage(named: "")
            winnerLabel2.text = ""
            if winner == "NO" {
                randomplayer()
            } else if winner == pName1 {
                announcementLabel2.text = ("\(winner) X will start now")
                player1 = true
                winnerLabel2.text = " "
            } else  if winner == pName2 {
                announcementLabel2.text = ("\(winner) O will start now")
                player2 = true
                winnerLabel2.text = " "
        }
    }
}
}
