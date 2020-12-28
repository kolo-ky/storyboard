//
//  ViewController.swift
//  calc
//
//  Created by ALEKSANDR KOLOSOVSKIY on 28.12.2020.
//  Copyright © 2020 ALEKSANDR KOLOSOVSKIY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var operation = "";
    var firstNumber = "";
    var secondNumber = "";
    var result = "";

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func NumberButtonPressed(_ sender: UIButton) {
        guard let numberString = sender.titleLabel?.text
        else { return }
        
        let number = Int(numberString)!;
        
        if operation == "" {
            if firstNumber == "" && number == 0 {
                return
            }
            
            firstNumber += String(number)
            resultLabel.text = firstNumber;
        } else {
            if secondNumber == "" && number == 0 {
                return
            }
            
            secondNumber += String(number)
            resultLabel.text = secondNumber;
        }
    }
    
    @IBAction func OperationButtonPressed(_ sender: UIButton) {
        guard let operationString = sender.titleLabel?.text
        else { return }
        
        if (operationString == "=") {
            doOperation()
        } else {
            operation = operationString;
            if firstNumber != "" && secondNumber != "" {
                doOperation()
            } else {
                return;
            }
        }
        
        updateVar();
    }
    
    func updateVar() {
        resultLabel.text = result;
        firstNumber = result;
        secondNumber = "";
    }
    
    func doOperation() {
        
        let first = Int(firstNumber);
        let second = Int(secondNumber);
        
        if operation == "+" {
          result = String(first! + second!);
        }
        
        if operation == "-" {
          result = String(first! - second!);
        }
        
        if operation == "÷" {
          result = String(first! / second!);
        }
        
        if operation == "×" {
          result = String(first! * second!);
        }
    }
    
    @IBAction func ClearButtonPressed(_ sender: UIButton) {
        firstNumber = "";
        secondNumber = "";
        operation = "";
        result = "";
        resultLabel.text = "0";
    }
    @IBAction func PointButtonPressed(_ sender: UIButton) {
        print(4)
    }

}

