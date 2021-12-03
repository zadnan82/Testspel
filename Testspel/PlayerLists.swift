//
//  PlayerLists.swift
//  Testspel
//
//  Created by ITHS on 2021-12-02.
//

import Foundation
import UIKit

class Game {
    
  //  var winList3 = [[ 1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,4,9],[3,5,7]]
    
 //   var winList4 = [[1,2,3,4],[5,6,7,8] ,[9,10,11,12],[13,14,15,16],[1,5,9,13],[2,6,10,14],
 //                   [3,7,11,15],[4,8,12,16],[ 1,6,11,16],[4,7,10,13]]
    
    var player1list = [Int]()
    var player2list = [Int]()
    
    
    func canPlay(imageLocation : Int ) -> Bool {
        
        if ![imageLocation].allSatisfy(player1list.contains)
            && ![imageLocation].allSatisfy(player2list.contains){
            
            return true
            
        } else {
            return false }
    }
    
    func addToPlayer1List(imageLocation: Int){
        player1list.append(imageLocation)
    }
    
    
    func addToPlayer2List(imageLocation: Int){
        player2list.append(imageLocation)
        
    }
    
    func checkWinner(player1 : Bool , choice : String) ->  Bool {
        
        var playerlist = [Int]()
        if player1 {
            
            playerlist = player1list
        } else {
            playerlist = player2list
        }
            
        if choice == "3 X 3" {
            
            if [1, 2, 3].allSatisfy(playerlist.contains) ||
                [4, 5, 6].allSatisfy(playerlist.contains){
                return true }
            else  if [7, 8 , 9 ].allSatisfy(playerlist.contains)  ||
                        [1 , 4 , 7 ].allSatisfy(playerlist.contains) {
                return true }
            else  if [2 , 5 , 8].allSatisfy(playerlist.contains) ||
                        [3 , 6 , 9].allSatisfy(playerlist.contains){
                return true }
            else  if [1 , 5 , 9 ].allSatisfy(playerlist.contains) ||
                        [3 , 5 , 7 ].allSatisfy(playerlist.contains){
                return true  }
            
            else { return false }
        }
        else if choice == "4 X 4" {
            
            if [1, 2, 3 , 4 ].allSatisfy(playerlist.contains) ||
                [5, 6 , 7, 8].allSatisfy(playerlist.contains){
                return true}
            else  if [ 9 , 10 , 11 ,12 ].allSatisfy(playerlist.contains) ||
                        [13 , 14 , 15, 16 ].allSatisfy(playerlist.contains){
                return true}
            else  if [1 , 5 , 9 , 13].allSatisfy(playerlist.contains) ||
                        [2 , 6 , 10 , 14].allSatisfy(playerlist.contains){
                return true}
            else  if [3 , 7 , 11 , 15 ].allSatisfy(playerlist.contains) ||
                        [4 , 8 , 12 , 16 ].allSatisfy(playerlist.contains){
                return true}
            else  if [1 , 6 , 11 , 16 ].allSatisfy(playerlist.contains) ||
                        [4 , 7 , 10 , 13 ].allSatisfy(playerlist.contains){
                return true}
            
            else {return false}
        }
        
        else {return false}
    }
    
    func clearLists() {
        player1list.removeAll() ; player2list.removeAll()
    }
    
    func checkDraw(choice : String) -> Bool  {
        var limit = 0
        if choice == "3 X 3" {
          limit = 8
        } else if choice == "4 X 4"{
            limit = 15
        }
        
        if player1list.count + player2list.count > limit {
            return true
        } else {
            return false }
    }
    
    
}

