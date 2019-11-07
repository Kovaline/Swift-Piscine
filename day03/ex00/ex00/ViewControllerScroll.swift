//
//  ViewControllerScroll.swift
//  ex00
//
//  Created by Ihor KOVALENKO on 10/3/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import UIKit

class ViewControllerScroll: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scroller: UIScrollView!
    var img = UIImage();
    var bigImage: UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()

        bigImage = UIImageView(image: img)
        scroller.addSubview(bigImage!)
        scroller.contentSize = (bigImage?.frame.size)!
        scroller.maximumZoomScale = 50;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setZoomScale() {
        
        var minZoom = min(self.view.bounds.size.width / bigImage!.bounds.size.width, self.view.bounds.size.height / bigImage!.bounds.size.height);
        
        if (minZoom > 1.0) {
            minZoom = 1.0;
        }
        
        scroller.minimumZoomScale = minZoom;
        scroller.zoomScale = minZoom;
        
    }
    
    override func viewWillLayoutSubviews() {
        setZoomScale()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return bigImage;
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
