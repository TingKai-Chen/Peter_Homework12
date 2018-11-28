//
//  ViewController.swift
//  Peter_Homework12
//
//  Created by 陳庭楷 on 2018/11/25.
//  Copyright © 2018年 陳庭楷. All rights reserved.
//

import UIKit

enum CalculationType {
    
    case add
    
    case subtract
    
    case multiply
    
    case divide
    
    case none
    
}

class ViewController: UIViewController {
    
    var calculation : CalculationType = .none
    
    var beforeNumbers = 0.0
    
    var afterNumbers = 0.0
    
    var startNew = true
    
    @IBOutlet weak var displayLabel: UILabel!
 
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
        
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        
        let inputNumbers = sender.tag - 1
        
        if self.startNew == true {
            
            self.displayLabel.text = "\(inputNumbers)"
            
            self.startNew = false
            
        }
        
        else {
            
            if self.displayLabel.text! == "0" || self.displayLabel.text! == "+" || self.displayLabel.text! == "-" || self.displayLabel.text! == "X" || self.displayLabel.text! == "/" {
                
                self.displayLabel.text = "\(inputNumbers)"
                
            }
                
            else {
                
                self.displayLabel.text = self.displayLabel.text! + "\(inputNumbers)"
                
            }
            
        }
        
        self.afterNumbers = Double(self.displayLabel.text!)!
        
    }
    
    @IBAction func add(_ sender: UIButton) {
        
        self.displayLabel.text = "+"
        
        self.calculation = .add
        
        self.beforeNumbers = self.afterNumbers
        
    }
    
    @IBAction func subtract(_ sender: UIButton) {
        
        self.displayLabel.text = "-"
        
        self.calculation = .subtract
        
        self.beforeNumbers = self.afterNumbers
        
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        
        self.displayLabel.text = "X"
        
        self.calculation = .multiply
        
        self.beforeNumbers = self.afterNumbers
        
    }
    
    @IBAction func divide(_ sender: UIButton) {
        
        self.displayLabel.text = "/"
        
        self.calculation = .divide
        
        self.beforeNumbers = self.afterNumbers
        
    }

    @IBAction func result(_ sender: UIButton) {        
        
        switch self.calculation {
            
        case .add :
            
            self.afterNumbers = self.beforeNumbers + self.afterNumbers
            
            turnNumber(self.afterNumbers)
            
        case .subtract :
            
            self.afterNumbers = self.beforeNumbers - self.afterNumbers
            
            turnNumber(self.afterNumbers)
            
        case .multiply :
            
            self.afterNumbers = self.beforeNumbers * self.afterNumbers
            
            turnNumber(self.afterNumbers)
            
        case .divide :
            
            self.afterNumbers = self.beforeNumbers / self.afterNumbers
            
            turnNumber(self.afterNumbers)
            
        case .none :
            
            self.displayLabel.text = "\(self.afterNumbers)"
         
        }
        
        self.startNew = true
        
    }
    
    @IBAction func clean(_ sender: UIButton) {
        
        self.displayLabel.text = "0"
        
        self.beforeNumbers = 0
        
        self.afterNumbers = 0
        
        self.calculation = .none
        
        self.startNew = true

    }
    
    func turnNumber ( _ number : Double ) {
        
        var okText : String
        
        if floor(number) == number {

            okText = "\(Int(number))"
            
        }
        
        else {
            
            okText = "\(number)"
            
        }
        
        if okText.count >= 10 {
            
            okText = String(okText.prefix(10))
            
        }
        
        self.displayLabel.text = okText
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
}

