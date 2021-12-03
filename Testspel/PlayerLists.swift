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
    
    func checkWinner1(player1 : Bool , choic : String) ->  Bool {
        print ( choic)
        if choic == "3 X 3" {
            
            if [1, 2, 3].allSatisfy(player1list.contains) ||
                [4, 5, 6].allSatisfy(player1list.contains){
                return true }
            else  if [7, 8 , 9 ].allSatisfy(player1list.contains) ||
                        [1 , 4 , 7 ].allSatisfy(player1list.contains){
                return true }
            else  if [2 , 5 , 8].allSatisfy(player1list.contains) ||
                        [3 , 6 , 9].allSatisfy(player1list.contains){
                return true }
            else  if [1 , 5 , 9 ].allSatisfy(player1list.contains) ||
                        [3 , 5 , 7 ].allSatisfy(player1list.contains){
                return true  }
            
            else { return false }
        }
        else if choic == "4 X 4" {
            
            if [1, 2, 3 , 4 ].allSatisfy(player1list.contains) ||
                [5, 6 , 7, 8].allSatisfy(player1list.contains){
                return true}
            else  if [ 9 , 10 , 11 ,12 ].allSatisfy(player1list.contains) ||
                        [13 , 14 , 15, 16 ].allSatisfy(player1list.contains){
                return true}
            else  if [1 , 5 , 9 , 13].allSatisfy(player1list.contains) ||
                        [2 , 6 , 10 , 14].allSatisfy(player1list.contains){
                return true}
            else  if [3 , 7 , 11 , 15 ].allSatisfy(player1list.contains) ||
                        [4 , 8 , 12 , 16 ].allSatisfy(player1list.contains){
                return true}
            else  if [1 , 6 , 11 , 16 ].allSatisfy(player1list.contains) ||
                        [4 , 7 , 10 , 13 ].allSatisfy(player1list.contains){
                return true}
            
            else {return false}
        }
        
        else {return false}
    }
    
    func checkWinner2(player2 : Bool , choic : String ) ->  Bool {
        print ( choic)
        if choic == "3 X 3" {
            
            if [1 , 2, 3 ].allSatisfy(player2list.contains) ||
                [ 4 , 5 , 6 ].allSatisfy(player2list.contains){
                return true   }
            else  if [ 7 , 8 , 9 ].allSatisfy(player2list.contains) ||
                        [ 1 , 4 , 7].allSatisfy(player2list.contains)  {
                return true  }
            else  if [ 2 , 5 , 8 ].allSatisfy(player2list.contains) ||
                        [3 , 6 , 9 ].allSatisfy(player2list.contains) {
                return true }
            else  if [1, 5 , 9 ].allSatisfy(player2list.contains) ||
                        [3 , 5 , 7 ].allSatisfy(player2list.contains) {
                return true  }
            
            else { return false }
        }
        else if choic == "4 X 4" {
            
            if [1, 2, 3 , 4 ].allSatisfy(player2list.contains) ||
                [5 , 6 , 7, 8] .allSatisfy(player2list.contains){
                return true }
            else  if [ 9 , 10 , 11 ,12 ].allSatisfy(player2list.contains) ||
                        [13 , 14 , 15, 16 ].allSatisfy(player2list.contains){
                return true   }
            else  if [1 , 5 , 9 , 13].allSatisfy(player2list.contains) ||
                        [2 , 6 , 10 , 14].allSatisfy(player2list.contains){
                return true }
            else  if [3 , 7 , 11 , 15 ].allSatisfy(player2list.contains) ||
                        [4 , 8 , 12 , 16 ].allSatisfy(player2list.contains){
                return true }
            else  if [1 , 6 , 11 , 16 ].allSatisfy(player2list.contains) ||
                        [4 , 7 , 10 , 13 ].allSatisfy(player2list.contains){
                return true}
            
            else {return false}
        }
        
        else {return false}
    }
    
    func clearLists() {
        player1list.removeAll() ; player2list.removeAll()
    }
    
    func checkDraw3() -> Bool  {
        if player1list.count + player2list.count > 8{
            return true
        } else {
            return false }
    }
    
    func checkDraw4() -> Bool  {
        if player1list.count + player2list.count > 15{
            return true
        } else {
            return false }
    }
}

