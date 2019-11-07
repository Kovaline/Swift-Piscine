//
//  AddArticleViewController.swift
//  day09
//
//  Created by Ihor KOVALENKO on 10/11/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import UIKit
import ikovalen2019
import AVFoundation

class AddArticleViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let pickerController = UIImagePickerController()
    let articleMan = ArticleManager();
    var oldarticle: Article?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title1: UITextField!
    @IBOutlet weak var contentView: UITextView!
    
    @IBAction func saveButton(_ sender: Any) {
        if (oldarticle == nil) {
            print ("imhere")
            let article = articleMan.newArticle();
            if title1.text != "" {
                article.title = title1.text
            }
            if contentView.text != "" {
                article.content = contentView.text
            }
            if imageView.image != nil {
                if let imageData = UIImageJPEGRepresentation(imageView.image!, 1){
                article.image = imageData as NSData?
                }
            }
            article.creation_date = NSDate()
            article.mod_date = NSDate();
        }
        else {
            oldarticle?.mod_date = NSDate()
            oldarticle?.title = title1.text
            oldarticle?.content = contentView.text
            if imageView.image != nil {
                if let imageData = UIImageJPEGRepresentation(imageView.image!, 1){
                    oldarticle?.image = imageData as NSData?
                }
            }
        }
        articleMan.save()
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func takePhoto(_ sender: Any) {
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
            if response {
                if(UIImagePickerController.isSourceTypeAvailable(.camera)) {
                    self.pickerController.sourceType = .camera
                    self.present(self.pickerController, animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(title: "Alert", message: "No Camera available", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
            let alert = UIAlertController(title: "Alert", message: "No Camera available", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
        
}
    
    
    @IBAction func selectPhoto(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            pickerController.sourceType = .photoLibrary
            present(pickerController, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertController(title: "Alert", message: "No Library available", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self;
        if (oldarticle != nil) {
            title1.text = oldarticle?.title
            contentView.text = oldarticle?.content
            if let image = oldarticle?.image {
                imageView.image = UIImage(data: image as Data)
            }
        }

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

