//
//  APITwitterDelegate.swift
//  ex00
//
//  Created by Ihor KOVALENKO on 10/4/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import Foundation



protocol APITwitterDelegate : class{
    func recieve(tweets: [Tweet]);
    func errorTweet(error: NSError);
}

class APIController {
    weak var delegate : APITwitterDelegate?
    let token : String
    
   
    
    init(delegate: APITwitterDelegate?, token : String) {
        self.delegate = delegate
        self.token = token
    }
    
    func execute(keyword : String){
        let url = NSURL(string: "https://api.twitter.com/1.1/search/tweets.json?q=" + keyword)
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "GET"
        request.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            if error != nil {
                DispatchQueue.main.async(execute: {
                    self.delegate?.errorTweet(error: error! as NSError)
                })
                return
            }
            
            let d = data
            do {
                var tweets: [Tweet] = []
                if let resp: Dictionary = try JSONSerialization.jsonObject(with: d!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any] {
                    if let statuses: [NSDictionary] = resp["statuses"] as? [NSDictionary]{
                        for status in statuses {
                            let name = (status["user"] as? NSDictionary)?["name"] as? String
                            let text = status["text"] as? String
                            if (name != nil) && (text != nil){
                                    tweets.append(Tweet(name: name!, text: text!))
                            }
                        }
                        DispatchQueue.main.async {
                            self.delegate?.recieve(tweets: tweets)
                        }
                    //print(tweets);
                    }
                }
            } catch (let err){
                DispatchQueue.main.async(execute: {
                    self.delegate?.errorTweet(error: err as NSError)
                })
                return
            }
            
        }
        task.resume()
    }
}

