//
//  Article.swift
//  ikovalen2019
//
//  Created by Ihor KOVALENKO on 10/10/19.
//

import UIKit
import CoreData

public class Article: NSManagedObject {
    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var language: String?
    @NSManaged public var image: NSData?
    @NSManaged public var creation_date: NSDate?
    @NSManaged public var mod_date: NSDate?
    
    override public var description: String
    {
        return ("title: \(String(describing: title ?? ""))\ncontent: \(String(describing: content ?? ""))\nlanguage: \(String(describing: language ?? ""))\ndate of creation: \(String(describing: creation_date ?? Date() as NSDate))\ndate of modification: \(String(describing: mod_date ?? Date() as NSDate))\nimage: \(String(describing: image ?? nil))\n\n")
    }
}
