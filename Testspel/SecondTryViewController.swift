//
//  SecondTryViewController.swift
//  Testspel
//
//  Created by ITHS on 2021-11-26.
//

import UIKit

class SecondTryViewController: UIViewController {

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
    var player1list = [Int]()
    var player2list = [Int]()
    var player1Score = 0
    var player2Score = 0
    var winner = ""
    var pName1 = ""
    var pName2 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1NameLabel.text = pName1
        player2NameLabel.text = pName2
        
        randomplayer()
    }
      
    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
    
        if let imageView = sender.view as? UIImageView {
            let imageLocation = imageView.tag
            if ![imageLocation].allSatisfy(player1list.contains) && ![imageLocation].allSatisfy(player2list.contains) {
            if player1 == true {
                imageView.image = UIImage(named: "xsign")
                player1 = false
                player2 = true
                player1list.append(Int(imageLocation))
                checkWinner()
                return
            }
               else  if player2 == true {
                   imageView.image = UIImage(named: "osign")
                        player1 = true
                        player2 = false
                   player2list.append(Int(imageLocation))
                   checkWinner()
                    return
                }
            }
    }
}
        
            func checkWinner() {
             
                if [1, 2, 3].allSatisfy(player1list.contains) ||
                   [4, 5, 6].allSatisfy(player1list.contains){
                   player1Check()
                }
                else  if [7, 8 , 9 ].allSatisfy(player1list.contains) ||
                            [1 , 4 , 7 ].allSatisfy(player1list.contains){
                             player1Check()
                         }
                else  if [2 , 5 , 8].allSatisfy(player1list.contains) ||
                            [3 , 6 , 9].allSatisfy(player1list.contains){
                            player1Check()
                         }
                else  if [1 , 5 , 9 ].allSatisfy(player1list.contains) ||
                            [3 , 5 , 7 ].allSatisfy(player1list.contains){
                            player1Check()
                         }
                else   if [1 , 2, 3 ].allSatisfy(player2list.contains) ||
                                [ 4 , 5 , 6 ].allSatisfy(player2list.contains){
                              player2Check()
                             }
                             else  if [ 7 , 8 , 9 ].allSatisfy(player2list.contains) ||
                                    [ 1 , 4 , 7 ].allSatisfy(player2list.contains)  {
                                 player2Check()
                                      }
                             else  if [ 2 , 5 , 8 ].allSatisfy(player2list.contains) ||
                                    [3 , 6 , 9 ].allSatisfy(player2list.contains) {
                                 player2Check()
                                      }
                             else  if [1, 5 , 9 ].allSatisfy(player2list.contains) ||
                                    [3 , 5 , 7 ].allSatisfy(player2list.contains) {
                                player2Check()
                                      }
                else if player1list.count + player2list.count > 8   {
                    winnerLabel.text = "No one gets a point!"
                    winner = "NO"
                    randomplayer()
                }
        }
    
    func player1Check(){
        winnerLabel.text = "\(pName1) gets a point!"
        player1Score += 1
        player1ScoreLabel.text = String(player1Score)
        winner = pName1
        deactivePlayers()
        return
    }
    
    func player2Check(){
        winnerLabel.text = "\(pName2) gets a point!"
        player2Score += 1
        player2ScoreLabel.text = String(player2Score)
        winner = pName2
        deactivePlayers()
        return
    }
    
    func randomplayer() {
        number = Int.random(in: 1..<3)
        if number == 1 {
            player1 = true
            player2 = false
            announcementLabel.text = "\(pName1) X will start playing"
            return
        } else {
            player2 = true
            player1 = false
            announcementLabel.text = "\(pName2) O will start playing"
            return
        }
    }
    
    func deactivePlayers(){
        player1 = false
        player2 = false
    }
    
    @IBAction func playAgain(_ sender: Any) {
        player1list.removeAll()
        player2list.removeAll()
        a1.image = UIImage(named: "")
        a2.image = UIImage(named: "")
        a3.image = UIImage(named: "")
        b1.image = UIImage(named: "")
        b2.image = UIImage(named: "")
        b3.image = UIImage(named: "")
        c1.image = UIImage(named: "")
        c2.image = UIImage(named: "")
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
    }
}
