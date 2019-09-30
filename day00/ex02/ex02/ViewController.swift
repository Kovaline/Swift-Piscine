//
//  ViewController.swift
//  ex02
//
//  Created by Ihor KOVALENKO on 9/30/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calcLable: UILabel!
    
   
    @IBAction func equalsButton(_ sender: Any) {
        print("Equals is pressed");
    }
   
    @IBAction func divideButton(_ sender: Any) {
        print("Divide is pressed");
    }
    @IBAction func minusButton(_ sender: Any) {
        print("Minus is pressed");
    }
    @IBAction func multiButton(_ sender: Any) {
        print("Multi is pressed");
    }
    @IBAction func plusButton(_ sender: Any) {
        print("Plus is pressed");
    }
    @IBAction func negButton(_ sender: Any) {
        print("Neg is pressed");
    }
    @IBAction func acButton(_ sender: Any) {
        print("AC is pressed");
    }
    @IBAction func buttonZero(_ sender: Any) {
        calcLable.text = "0";
        print("Zero is pressed");
    }
    @IBAction func buttonNine(_ sender: Any) {
        calcLable.text = "9";
        print("Nine is pressed");
    }
    @IBAction func buttonEight(_ sender: Any) {
        calcLable.text = "8";
        print("Eight is pressed");
    }
    @IBAction func buttonSeven(_ sender: Any) {
        calcLable.text = "7";
        print("Seven is pressed");
    }
    @IBAction func buttonSix(_ sender: Any) {
        calcLable.text = "6";
        print("Six is pressed");
    }
    @IBAction func buttonFive(_ sender: Any) {
        calcLable.text = "5";
        print("Five is pressed");
    }
    @IBAction func buttonFour(_ sender: Any) {
        calcLable.text = "4";
        print("Four is pressed");
    }
    @IBAction func buttonThree(_ sender: Any) {
        calcLable.text = "3";
        print("Three is pressed");
    }
    @IBAction func buttonTwo(_ sender: Any) {
        calcLable.text = "2";
        print("Two is pressed");
    }
    @IBAction func buttonOne(_ sender: Any) {
        calcLable.text = "1";
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

