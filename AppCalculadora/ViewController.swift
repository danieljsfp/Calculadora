//
//  ViewController.swift
//  AppCalculadora
//
//  Created by MacMini on 07/05/22.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0
    
    
    @IBOutlet weak var displayNumbers: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath == true {
            displayNumbers.text = String(sender.tag-1)
            numberOnScreen = Double(displayNumbers.text!)!
            performingMath = false
        } else {
        displayNumbers.text = displayNumbers.text! + String(sender.tag-1)
        numberOnScreen = Double(displayNumbers.text!)!
        }
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if displayNumbers.text != "" && sender.tag != 11 && sender.tag != 16 {
           
            previousNumber = Double(displayNumbers.text!)!
            
            if sender.tag == 12{ // divisão
                displayNumbers.text = "/"
            } else if sender.tag == 13{ // multiplic.
                displayNumbers.text = "x"
            } else if sender.tag == 14{ // menos
                displayNumbers.text = "-"
            } else if sender.tag == 15{ // mais
                displayNumbers.text = "+"
            }
            
            operation = sender.tag
            performingMath = true
        }
         else if sender.tag == 16{
            
         if operation == 12{
            displayNumbers.text = String(previousNumber / numberOnScreen)
        } else if operation == 13{
            displayNumbers.text = String(previousNumber * numberOnScreen)
        } else if operation == 14{
            displayNumbers.text = String(previousNumber - numberOnScreen)
        } else if operation == 15{
            displayNumbers.text = String(previousNumber + numberOnScreen)
        }
        
    }
         else if sender.tag == 11{
            displayNumbers.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
         }
}

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
}
	
