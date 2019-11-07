//
//  ViewController2.swift
//  ex00
//
//  Created by Ihor KOVALENKO on 10/2/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var pickerView: UIDatePicker!
    let todayDate = Date()
    var strDate : String = ""
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var deathField: UITextView!
    
    
    @IBAction func datePicker(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        strDate = dateFormatter.string(from: pickerView.date)
    }
    @IBAction func doneButton(_ sender: Any) {
        print(nameField.text! + " will die at " + strDate + " by " + deathField.text!);
        if nameField.text != "" {
            performSegue(withIdentifier: "toFirstView", sender: self);
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd MMMM yyyy HH:mm:ss";
        let date = dateFormatter.string(from: pickerView.date)
        Data.names.append((nameField.text!, deathField.text!, date))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.minimumDate = todayDate;
        let dateFormatter = DateFormatter()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        strDate = dateFormatter.string(from: pickerView.date)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
