//
//  ViewController.swift
//  ex00
//
//  Created by Ihor KOVALENKO on 10/3/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
   
    @IBOutlet var colView: UICollectionView!
    let Images : [URL] = [
        URL(string: "https://blogs.nasa.gov/spacestation/wp-content/uploads/sites/240/2019/10/crew_undocking_100219c.jpg")!,
        URL(string: "https://www.nasa.gov/sites/default/files/styles/ubernode_alt_horiz/public/thumbnails/image/hls_hero_00000_0.jpg")!,
        URL(string: "https://www.nasa.gov/sites/default/files/thumbnails/image/pia09761-16.jpg")!,
        URL(string: "https://www.nasa.gov/sites/default/files/thumbnails/image/bh_accretiondisk_sim_stationary_websize.gif")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let img = Images[indexPath.row]
        let queue = DispatchQueue.global(qos: .utility)
        
        queue.async {
            let data = try? Data(contentsOf: img)
            if data != nil {
                DispatchQueue.main.async {
                    cell.activityInd.hidesWhenStopped = true;
                    cell.activityInd.stopAnimating();
                    cell.imageView.image = UIImage(data: data!)
                }
            }else {
                let alert = UIAlertController(title: "Error", message: "Error while loading \(img)", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                cell.activityInd.hidesWhenStopped = true;
                cell.activityInd.stopAnimating();
            }
            
        }
        cell.activityInd.startAnimating();
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sega = segue.destination as! ViewControllerScroll
        let cell = sender as! CollectionViewCell
        if cell.imageView.image != nil {
        sega.img = cell.imageView.image!
        }
    }


}

