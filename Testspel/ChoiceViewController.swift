//
//  ChoiceViewController.swift
//  Testspel
//
//  Created by ITHS on 2021-11-26.
//

import UIKit

class ChoiceViewController: UIViewController , UIPickerViewDataSource , UIPickerViewDelegate {

    @IBOutlet weak var gamePickerView: UIPickerView!
    
    private var boardSize = [String](arrayLiteral: "3 X 3" , "4 X 4 " , "5 X 5")
    var layout : String?
    
    var seguesto3 = "seguesto3"
    var seguesto4 = "seguesto4"
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        let defaultPickerRow = 0
            
            gamePickerView.selectRow(defaultPickerRow, inComponent: 0, animated: false)
        
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
            print(game)
            if game == "4 X 4" {
                performSegue(withIdentifier: seguesto4, sender: self)
            }
            if game == "3 X 3" {
                performSegue(withIdentifier: seguesto3, sender: self)
        }
    }
     
}
   
/*
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == seguesto3 {
            let destinationVC = segue.destination as! SecondTryViewController
            }
    
   else if segue.identifier == segues4 {
        let destinationVC1 = segue.destination as! ViewController
        }
}
 */
    
    
}
