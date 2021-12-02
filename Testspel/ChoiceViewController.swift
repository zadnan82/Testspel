//
//  ChoiceViewController.swift
//  Testspel
//
//  Created by ITHS on 2021-11-26.
//

import UIKit

class ChoiceViewController: UIViewController , UIPickerViewDataSource , UIPickerViewDelegate {

    @IBOutlet weak var player1NameTF: UITextField!
    @IBOutlet weak var player2NameTF: UITextField!
    @IBOutlet weak var gamePickerView: UIPickerView!
    private var boardSize = [String](arrayLiteral: "3 X 3" , "4 X 4" )
    var layout : String?
    var seguesto3 = "seguesto3"
    var seguesto4 = "seguesto4"
    private let userDefaultsRowKey = "defaultsPickerRow"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaultPickerRow = initialPickerRow()
                
                gamePickerView.selectRow(defaultPickerRow, inComponent: 0, animated: false)
                pickerView(gamePickerView, didSelectRow: defaultPickerRow, inComponent: 0)
        
    }
    
    func initialPickerRow() -> Int {
            
            let savedRow = UserDefaults.standard.object(forKey: userDefaultsRowKey) as? Int
            if let row = savedRow {
                return row
            } else {
                return 0
            }
        }
        
    func saveSelected(row: Int) {
           let defaults = UserDefaults.standard
           defaults.set(row, forKey: userDefaultsRowKey)
           defaults.synchronize()
       }
       

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return boardSize.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ("\(boardSize[row])")
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        layout = boardSize[row]
        return
        }

    @IBAction func goToGame(_ sender: UIButton) {
        
            if let game = layout {
            if game == "4 X 4" {
                performSegue(withIdentifier: seguesto4, sender: self)
            }
            if game == "3 X 3" {
                performSegue(withIdentifier: seguesto3, sender: self)
        }
    }
  
     
}
   

 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
     if segue.identifier == seguesto3 {
            let destinationVC = segue.destination as! SecondTryViewController
         
         if let name1 = player1NameTF.text {
                    destinationVC.pName1 = String(name1)
                    
         } else {
             destinationVC.pName1 = "Player 1"
         }
                
                if let name2 = player2NameTF.text {
                    destinationVC.pName2 = String(name2)
                }
         
         if let game = layout {
             destinationVC.choice = String(game)
         }
         
     }
    
     else if  segue.identifier == seguesto4 {
        let destinationVC1 = segue.destination as! SecondTryViewController
         
         if let name1 = player1NameTF.text {
             destinationVC1.pName1 = String(name1)
         }
         
         if let name2 = player2NameTF.text {
             destinationVC1.pName2 = String(name2)
         }
         if let game = layout {
             destinationVC1.choice = String(game)
         }
        }
 }
    
    
}
