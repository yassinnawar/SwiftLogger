//
//  coreSaver.swift
//  InstabugLogger
//
//  Created by Yassin Nawar on 27/05/2022.
//

import Foundation
import UIKit
import CoreData


struct coreSaver{
    var logs: [NSManagedObject] = []
    
    
    mutating func save(message: String, level:String) {
      guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
        return
      }
      
      let managedContext = appDelegate.persistentContainer.viewContext
      let entity = NSEntityDescription.entity(forEntityName: "Log",in: managedContext)!
      let log = NSManagedObject(entity: entity,insertInto: managedContext)
        
      log.setValue(message, forKeyPath: "message")
      log.setValue(level, forKey: "level")
      
      do {
        try managedContext.save()
        logs.append(log)
      } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
      }
        
    }
    
    
    
    mutating func printCore() {
      guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
          return
      }

      let managedContext = appDelegate.persistentContainer.viewContext
      let records = fetchRecordsForEntity("Log", inManagedObjectContext: managedContext)
//     print(records.count)
        
        for i in 0..<records.count{
            print("Core \(i)= \(records[i])")
        }
    }
    
    
    private func fetchRecordsForEntity(_ entity: String, inManagedObjectContext managedObjectContext: NSManagedObjectContext) -> [NSManagedObject] {
        // Create Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)

        // Helpers
        var result = [NSManagedObject]()

        do {
            // Execute Fetch Request
            let records = try managedObjectContext.fetch(fetchRequest)

            if let records = records as? [NSManagedObject] {
                result = records
            }

        } catch {
            print("Unable to fetch managed objects for entity \(entity).")
        }

        return result
    }
    
    
    
    
    
   
    
    
    
    
    
    
    
    
    
}
