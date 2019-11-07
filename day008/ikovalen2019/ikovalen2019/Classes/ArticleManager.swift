//
//  ArticleManager.swift
//  ikovalen2019
//
//  Created by Ihor KOVALENKO on 10/10/19.
//

import UIKit
import CoreData

public class ArticleManager: NSObject {
    var managedObjectContext : NSManagedObjectContext
    
    public override init() {
        let thisBundle = Bundle(for: Article.self)
        guard let modelURL = thisBundle.url(forResource: "article", withExtension: "momd") else {
            fatalError("Error loading model from bundle")
        }
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        
        managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = psc
        guard let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
            fatalError("Unable to resolve document directory")
        }
        let storeURL = docURL.appendingPathComponent("DataModel.sqlite")
        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
    }
    
    public func newArticle () -> Article {
        return NSEntityDescription.insertNewObject(forEntityName: "Article", into: managedObjectContext) as! Article
    }
    
    public func getAllArticles() -> [Article] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        do {
            let result = try managedObjectContext.fetch(request) as! [Article]
            return result
        }catch{
            return []
        }
    }
    
    public func getArticles(withLang lang : String) -> [Article] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        request.predicate = NSPredicate(format: "language == %@", lang)
        do {
            let result = try managedObjectContext.fetch(request) as! [Article]
            return result
        }catch{
            return []
        }
    }
    
    public func getArticles(containString str: String) -> [Article] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        request.predicate = NSPredicate(format: "title CONTAINS %@ || content CONTAINS %@", str, str)
        do {
            let result = try managedObjectContext.fetch(request) as! [Article]
            return result
        }catch{
            return []
        }
    }
    
    public func removeArticle(article : Article) {
        managedObjectContext.delete(article)
    }
    
    public func save() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            }
            catch{
                fatalError("Fail to save content \(error)");
            }
        }
    }
}
