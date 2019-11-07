//
//  ViewController.swift
//  ex02
//
//  Created by Ihor KOVALENKO on 9/30/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    public var number:String = "";
    public var digit:Int = 0;
    public var digit2:Int = 0;
    public var result:Int = 0;
    public var sign:String = "";
    public var equal:Int = 0;
    @IBOutlet weak var calcLable: UILabel!
    
    func calculate()
    {
        switch(sign) {
        case "/":
            if (digit2 != 0){
                result = digit / digit2;
            } else {
                print(digit)
                calcLable.text = "Not a number";
                result = 0;
                digit = 0;
                digit2 = 0;
                number = "";
            }
        case "*":
            result = digit * digit2;
        case "-":
            result = digit - digit2;
        case "+":
            result = digit + digit2;
        default:
            result = Int(number)!;
        }
        calcLable.text = String(result);
    }
    
    @IBAction func equalsButton(_ sender: Any) {
        if (number != "") {
            if (digit != 0){
                digit2 = Int(number)!;
                calculate();
            } else {
                digit = Int(number)!;
            }
            if (result != 0){
                digit = result;
            }
            number = String(result);
            sign = "";
            equal = 1;
        }
        print("Equals is pressed");
    }
   
    @IBAction func divideButton(_ sender: Any) {
        if (equal == 1) {
            sign = "/";
            equal = 0;
            number = "";
        } else if (number != ""){
            if (digit != 0){
                digit2 = Int(number)!;
                calculate();
            } else {
                digit = Int(number)!;
            }
            if (result != 0){
                digit = result;
            }
            sign = "/";
            number = "";
        } else {
            sign = "/";
        }
        print("Divide is pressed");
    }
    @IBAction func minusButton(_ sender: Any) {
        if (equal == 1) {
            sign = "-";
            equal = 0;
            number = "";
        } else if (number != ""){
            if (digit != 0){
                digit2 = Int(number)!;
                calculate();
            } else {
                digit = Int(number)!;
            }
            if (result != 0){
                digit = result;
            }
            sign = "-";
            number = "";
        } else {
            sign = "-";
        }
        print("Minus is pressed");
    }
    @IBAction func multiButton(_ sender: Any) {
        if (equal == 1) {
            sign = "*";
            equal = 0;
            number = "";
        } else if (number != ""){
            if (digit != 0){
                digit2 = Int(number)!;
                calculate();
            } else {
                digit = Int(number)!;
            }
            if (result != 0){
                digit = result;
            }
            sign = "*";
            number = "";
        } else {
            sign = "*";
        }
        print("Multi is pressed");
    }
    @IBAction func plusButton(_ sender: Any) {
        if (equal == 1) {
            sign = "+";
            equal = 0;
            number = "";
        } else if (number != ""){
            if (digit != 0){
                digit2 = Int(number)!;
                calculate();
            } else {
                digit = Int(number)!;
            }
            if (result != 0){
                digit = result;
            }
            sign = "+";
            number = "";
        } else {
            sign = "+";
        }
        print("Plus is pressed");
    }
    @IBAction func negButton(_ sender: Any) {
        if (number != "" && Int(number) != 0) {
            if (Int(number)! > 0) {
                number = "-" + number;
            } else {
                number.remove(at: number.startIndex);
            }
            if (result != 0){
                result = Int(number)!;
                digit = Int(number)!;
            }
            calcLable.text = number;
            print("Neg is pressed");
        }
    }
    @IBAction func acButton(_ sender: Any) {
        print("AC is pressed");
        calcLable.text = "0";
        number = "";
        digit = 0;
        digit2 = 0;
        sign = "";
        result = 0;
    }
    @IBAction func buttonZero(_ sender: Any) {
        if (equal == 1){
            number = "";
            digit = 0;
            digit2 = 0;
            result = 0;
        }
        equal = 0;
        if (Int(calcLable.text!) != 0) {
            number = number + "0";
            calcLable.text = number;
        }
        print("Zero is pressed");
    }
    @IBAction func buttonNine(_ sender: Any) {
        if (equal == 1){
            number = "";
            digit = 0;
            digit2 = 0;
            result = 0;
        }
        equal = 0;
        number = number + "9";
        calcLable.text = number;
        print("Nine is pressed");
    }
    @IBAction func buttonEight(_ sender: Any) {
        if (equal == 1){
            number = "";
            digit = 0;
            digit2 = 0;
            result = 0;
        }
        equal = 0;
        number = number + "8";
        calcLable.text = number;
        print("Eight is pressed");
    }
    @IBAction func buttonSeven(_ sender: Any) {
        if (equal == 1){
            number = "";
            digit = 0;
            digit2 = 0;
            result = 0;
        }
        equal = 0;
        number = number + "7";
        calcLable.text = number;
        print("Seven is pressed");
    }
    @IBAction func buttonSix(_ sender: Any) {
        if (equal == 1){
            number = "";
            digit = 0;
            digit2 = 0;
            result = 0;
        }
        equal = 0;
        number = number + "6";
        calcLable.text = number;
        print("Six is pressed");
    }
    @IBAction func buttonFive(_ sender: Any) {
        if (equal == 1){
            number = "";
            digit = 0;
            digit2 = 0;
            result = 0;
        }
        equal = 0;
        number = number + "5";
        calcLable.text = number;
        print("Five is pressed");
    }
    @IBAction func buttonFour(_ sender: Any) {
        if (equal == 1){
            number = "";
            digit = 0;
            digit2 = 0;
            result = 0;
        }
        equal = 0;
        number = number + "4";
        calcLable.text = number;
        print("Four is pressed");
    }
    @IBAction func buttonThree(_ sender: Any) {
        if (equal == 1){
            number = "";
            digit = 0;
            digit2 = 0;
            result = 0;
        }
        equal = 0;
        number = number + "3";
        calcLable.text = number;
        print("Three is pressed");
    }
    @IBAction func buttonTwo(_ sender: Any) {
        if (equal == 1){
            number = "";
            digit = 0;
            digit2 = 0;
            result = 0;
        }
        equal = 0;
        number = number + "2";
        calcLable.text = number;
        print("Two is pressed");
    }
    @IBAction func buttonOne(_ sender: Any) {
        if (equal == 1){
            number = "";
            digit = 0;
            digit2 = 0;
            result = 0;
        }
        equal = 0;
        number = number + "1";
        calcLable.text = number;
        print("One is pressed");
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

