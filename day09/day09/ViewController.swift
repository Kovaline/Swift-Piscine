//
//  ViewController.swift
//  day09
//
//  Created by Ihor KOVALENKO on 10/11/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    let context = LAContext();
    @IBAction func touchId(_ sender: Any) {
        authentification();
    }
    
    func authentification() {
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
        {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "You need to be authentificated", reply:{ (success, error) -> Void in
                if success
                {
                    print ("Touch ID succed")
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "authSeg", sender: "")
                    }
                }
                else
                {
                    print ("Failed to authentificate")
                    DispatchQueue.main.async {
                        self.authentification()
                    }
                }
            })
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "authSeg" {
            let abcViewController = segue.destination as! DiaryViewController
            abcViewController.title = "Diary"
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

