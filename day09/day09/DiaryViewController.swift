//
//  DiaryViewController.swift
//  day09
//
//  Created by Ihor KOVALENKO on 10/11/19.
//  Copyright © 2019 Ihor KOVALENKO. All rights reserved.
//

import UIKit
import ikovalen2019

class DiaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView : UITableView!
    var articles: [Article]?
    let articleMan = ArticleManager();
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        tableView.delegate = self
        tableView.dataSource = self;
        articles = articleMan.getAllArticles()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        articles = articleMan.getAllArticles()
        articleMan.save()
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (articles?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let formatter = DateFormatter();
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        if (articles?[indexPath.row] != nil) {
            let currentArticle = articles![indexPath.row]
            cell.title.text = currentArticle.title
            if (currentArticle.creation_date != nil) {
                let dateString = formatter.string(from: currentArticle.creation_date! as Date)
                cell.creation_date.text = NSLocalizedString("Created", comment: "") + dateString
            }
             if (currentArticle.mod_date != nil) {
               let dateString = formatter.string(from: currentArticle.mod_date! as Date)
                cell.mod_date.text = "Modified: " + dateString;
           }
            
            if currentArticle.mod_date == currentArticle.creation_date {
                cell.mod_date.isHidden = true
            } else {
                cell.mod_date.isHidden = false
            }
            cell.photo.image = (currentArticle.image != nil) ? UIImage(data: currentArticle.image! as Data) : UIImage(named: "noimage")
            cell.photo.contentMode = .scaleAspectFit
            cell.photo.clipsToBounds = true;
            cell.content.text = currentArticle.content
        }
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addArticle", sender: articles![indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            articleMan.removeArticle(article: articles![indexPath.row])
            articleMan.save()
            articles?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .none)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let seg = segue.destination as? AddArticleViewController {
            if (segue.identifier == "addArticle" && sender != nil) {
                seg.oldarticle = sender as? Article;
            }
        }
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
