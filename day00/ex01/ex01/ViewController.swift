//
//  ViewController.swift
//  ex01
//
//  Created by Ihor KOVALENKO on 9/30/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    @IBAction func Button(_ sender: Any) {
        if (Label.text == "Hello world!") {
            Label.text = "This is label"
        } else {
            Label.text = "Hello world!";
        }
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

