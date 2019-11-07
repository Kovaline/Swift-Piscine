//
//  ViewController.swift
//  ikovalen2019
//
//  Created by Kovaline on 10/10/2019.
//  Copyright (c) 2019 Kovaline. All rights reserved.
//

import UIKit
import ikovalen2019

class ViewController: UIViewController {
    
    let articleMan = ArticleManager();
        override func viewDidLoad() {
        super.viewDidLoad()
        let article = articleMan.newArticle();
        article.title = "Article 1"
        article.content = "Day08 and Article 1"
        article.creation_date = NSDate();
        article.mod_date = NSDate();
        article.language = "en"
        articleMan.save()
        
        let article2 = articleMan.newArticle()
        article2.title = "Article 2"
        article2.content = "Day08 and Artictle 2"
        article2.creation_date = NSDate()
        article2.mod_date = NSDate()
        article2.language = "en"
        articleMan.save()
        
        print(articleMan.getAllArticles())
        print(articleMan.getArticles(withLang: "en"))
        print(articleMan.getArticles(containString: "Article 1"))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

