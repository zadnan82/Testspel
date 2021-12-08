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
    var ai : Bool = false
    var number = 0
    var player1Score = 0
    var player2Score = 0
    var playerScore = 0
    var winner = ""
    var pName1 = "Player 1"
    var pName2 = "Player 2"
    var choice = ""
    var pName = ""
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
        
        if ai == false {
        randomplayer()
        } else {
            aiTurn()
        }
    }
    
    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        let imageLocation = imageView.tag
        if ai == false {
        if game.canPlay(imageLocation: imageLocation) {
            if player1 == true {
                imageView.image = UIImage(named: "xsign")
                game.addToPlayer1List(imageLocation: imageLocation)
                if game.checkWinner( player1: player1 , choice: choice) {
                    playerCheck(player1: player1)
                    return
                    }
                player1 = false ; player2 = true
                }
            else  if player2 == true {
                imageView.image = UIImage(named: "osign")
                game.addToPlayer2List(imageLocation: imageLocation)
                if game.checkWinner( player1: player1 , choice: choice) {
                    playerCheck(player1: player1)
                    return
                    }
                player2 = false ; player1 = true
                }
        }
        } else {
            if game.canPlay(imageLocation: imageLocation) {
                
                if player1 == true {
                    print("player 1 is true ")
                    imageView.image = UIImage(named: "xsign")
                    print("player 1 image is placed ")
                    game.addToPlayer1List(imageLocation: imageLocation)
                    print("player 1 add to list ")
                    if game.checkWinner( player1: player1 , choice: choice) {
                        print("player 1 checked for win ")
                        playerCheck(player1: player1)
                        print("player 1 in announced")
                        return
                        }
                    player1 = false ; player2 = true
                    print("player 1 switched to false ")
            if randomAI() {
                print("randomai is done ")
                if game.checkWinner( player1: player1 , choice: choice) {
                    print("ai is checked for win")
                    playerCheck(player1: player1)
                    print("ai is announed ")
                    return
                    }
                player1 = true ; player2 = false
                }
    }
            }
        }
        if game.checkDraw(choice : choice) {
                winnerLabel?.text = "No one gets a point!"
                winnerLabel2?.text = "No one gets a point!"
                winner = "NO"
         }
        return
    }
    
    func aiTurn() {
        player1 = true ; player2 = false
        announcementLabel?.text = "\(pName1) X will start playing"
        announcementLabel2?.text = "\(pName1) X will start playing"
        
    }
        func randomAI() -> Bool {
            var list : [Int]
           let list3 = [1, 2, 3, 4, 5,6,7,8,9]
            let list4 = [1, 2, 3, 4, 5,6,7,8,9,10,11, 12, 13, 14, 15,16]
            if choice == "3 X 3" {
                list = list3
            } else { list = list4}
            
            list.shuffle()
            
            for randomPosition in list {
              
                if game.canPlay(imageLocation: randomPosition) {
                    var imageV : UIImageView?
                   let ai = randomPosition
                   if choice == "3 X 3" {
                    if ai == 1 { imageV = a1
                        imageV?.image = UIImage(named: "osign")}
                    else if ai == 2 { imageV = a2
                        imageV?.image = UIImage(named: "osign")}
                    else if ai == 3 { imageV = a3
                        imageV?.image = UIImage(named: "osign")}
                    else  if ai == 4 { imageV = b1
                        imageV?.image = UIImage(named: "osign")}
                    else if ai == 5 { imageV = b2
                        imageV?.image = UIImage(named: "osign")}
                    else if ai == 6 { imageV = b3
                        imageV?.image = UIImage(named: "osign")}
                    else if ai == 7 { imageV = c1
                        imageV?.image = UIImage(named: "osign")}
                    else if ai == 8 { imageV = c2
                        imageV?.image = UIImage(named: "osign")}
                    else if ai == 9 { imageV = c3
                        imageV?.image = UIImage(named: "osign")}
                    game.addToPlayer2List(imageLocation: randomPosition)
                    return true
                   } else {
                       
                       if ai == 1 { imageV = a11
                           imageV?.image = UIImage(named: "osign")}
                       else if ai == 2 { imageV = a22
                           imageV?.image = UIImage(named: "osign")}
                       else if ai == 3 { imageV = a33
                           imageV?.image = UIImage(named: "osign")}
                       else  if ai == 4 { imageV = a44
                           imageV?.image = UIImage(named: "osign")}
                       else if ai == 5 { imageV = b11
                           imageV?.image = UIImage(named: "osign")}
                       else if ai == 6 { imageV = b22
                           imageV?.image = UIImage(named: "osign")}
                       else if ai == 7 { imageV = b33
                           imageV?.image = UIImage(named: "osign")}
                       else if ai == 8 { imageV = b44
                           imageV?.image = UIImage(named: "osign")}
                       else if ai == 9 { imageV = c11
                           imageV?.image = UIImage(named: "osign")}
                       else if ai == 10 { imageV = c22
                           imageV?.image = UIImage(named: "osign")}
                       else if ai == 11 { imageV = c33
                           imageV?.image = UIImage(named: "osign")}
                       else if ai == 12 { imageV = c44
                           imageV?.image = UIImage(named: "osign")}
                       else  if ai == 13 { imageV = d11
                           imageV?.image = UIImage(named: "osign")}
                       else if ai == 14 { imageV = d22
                           imageV?.image = UIImage(named: "osign")}
                       else if ai == 15 { imageV = d33
                           imageV?.image = UIImage(named: "osign")}
                       else if ai == 16 { imageV = d44
                           imageV?.image = UIImage(named: "osign")}
                       game.addToPlayer2List(imageLocation: randomPosition)
                       return true
                   }
        }
            }
            return false
        }
            
    func playerCheck(player1 : Bool){
    
        if player1 {
            pName = pName1
            player1Score += 1
            playerScore = player1Score
            player1ScoreLabel?.text = String(playerScore)
            player1ScoreLabel2?.text = String(playerScore)
        } else {
            pName = pName2
            player2Score += 1
            playerScore = player2Score
            player2ScoreLabel?.text = String(playerScore)
            player2ScoreLabel2?.text = String(playerScore)
        }
        winnerLabel?.text = "\(pName) gets a point!"
        winnerLabel2?.text = "\(pName) gets a point!"
        winner = pName
        deactivePlayers()
        return
    }
 
    func randomplayer() {
        number = Int.random(in: 1..<3)
        if number == 1 {
            player1 = true ; player2 = false
            announcementLabel?.text = "\(pName1) X will start playing"
            announcementLabel2?.text = "\(pName1) X will start playing"
            return
        } else {
            player2 = true ; player1 = false
            announcementLabel?.text = "\(pName2) O will start playing"
            announcementLabel2?.text = "\(pName2) O will start playing"
            return
        }
    }
    
    func deactivePlayers(){
        player1 = false ; player2 = false
    }
    
    @IBAction func playAgain(_ sender: Any) {
       
        game.clearLists()
        a1?.image = UIImage(named: "") ; a2?.image = UIImage(named: "")
        a3?.image = UIImage(named: "") ; b1?.image = UIImage(named: "")
        b2?.image = UIImage(named: "") ; b3?.image = UIImage(named: "")
        c1?.image = UIImage(named: "") ; c2?.image = UIImage(named: "")
        c3?.image = UIImage(named: "")
        a11?.image = UIImage(named: ""); a22?.image = UIImage(named: "")
        a33?.image = UIImage(named: ""); a44?.image = UIImage(named: "")
        b11?.image = UIImage(named: ""); b22?.image = UIImage(named: "")
        b33?.image = UIImage(named: ""); b44?.image = UIImage(named: "")
        c11?.image = UIImage(named: ""); c22?.image = UIImage(named: "")
        c33?.image = UIImage(named: ""); c44?.image = UIImage(named: "")
        d11?.image = UIImage(named: ""); d22?.image = UIImage(named: "")
        d33?.image = UIImage(named: ""); d44?.image = UIImage(named: "")
        winnerLabel?.text = ""
        winnerLabel2?.text = ""
        
        if ai {
            aiTurn()
        } else {
         if winner == pName1 {
            announcementLabel?.text = ("\(winner) X will start now")
            announcementLabel2?.text = ("\(winner) X will start now")
            player1 = true
        } else  if winner == pName2 {
            announcementLabel?.text = ("\(winner) O will start now")
            announcementLabel2?.text = ("\(winner) O will start now")
            player2 = true
        }  else if winner == "NO" {
            randomplayer()
        }
    }
}
}
