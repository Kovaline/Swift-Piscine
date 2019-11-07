//
//  ViewController.swift
//  ex00
//
//  Created by Ihor KOVALENKO on 10/4/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, APITwitterDelegate, UITableViewDelegate, UITableViewDataSource{
   
    @IBOutlet weak var tweetsTable: UITableView!
    
    var tweets : [Tweet] = []
    var token: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let CUSTOMER_KEY = "jS3FezO46GonAYNwKNtuitjsH"
        let CUSTOMER_SECRET = "BSFnEuVSAdklXTuCPfruLOORWVZ0ylXZGLMNyiLS3dR3BcGgsD"
        let BEARER = ((CUSTOMER_KEY + ":" + CUSTOMER_SECRET).data(using: String.Encoding.utf8))!.base64EncodedString()
        let url = URL(string: "https://api.twitter.com/oauth2/token")
        var request = URLRequest(url: url!)
        request.httpMethod = "Post"
        request.setValue("Basic " + BEARER, forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded;CHARSET=UTF-8", forHTTPHeaderField: "Content-type")
        request.httpBody = "grant_type=client_credentials".data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            print(response!)
            if error != nil {
                print(error!)
            }
            else {
                do {
                    if let dic : Dictionary = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                    for (key, value) in dic {
                        if key == "access_token" {
                            self.token = value as! String
                        }
                }
                        let controller = APIController(delegate: self, token: self.token)
                        controller.execute(keyword: "q=" + "school".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! + "&src=typd&lang=fr&count=100&result_type=recent")
            }
                    print(self.tweets);
        }
                catch (let err){
                    print(err)
                }
            }
        }
        task.resume()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tweetsTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        print("hey")
        print(tweets[indexPath.row].text)
        cell.nameLabel.text = tweets[indexPath.row].name
        cell.tweetLabel.text = tweets[indexPath.row].text
        
        
        return cell;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func recieve(tweets: [Tweet]) {
        self.tweets = tweets
        tweetsTable.reloadData()
    }
    
    func errorTweet(error: NSError) {
        print(error)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

