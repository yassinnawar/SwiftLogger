//
//  ViewController.swift
//  DemoApp
//
//  Created by Yassin Nawar on 27/06/2022.
//

import UIKit
import Logger


class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ManualTest();
    }
    
    
    

            

       
    
    
    func ManualTest(){
        //Create random strings with random different lengths
        let numberOfLogs = 2000;
        let maxStringLength = 1500;
        print("generating \(numberOfLogs) logs with max length \(maxStringLength) each and logging them now")
        for i in 1...numberOfLogs {
            Logger.shared.log(Int.random(in: 1..<4), message: randomString(length: Int.random(in: 1..<maxStringLength)))
        }

        //save Logs
        print("saving in CoreData")
        var c = coreSaver();
        for i in 0..<1000 {
            let dataToSave = Logger.shared.fetchAllLogs()
            c.save(message: dataToSave.items[i].1, level: dataToSave.items[i].0)
        }
        
        //PrintLogs
        //Print from Logger
        print("\n \n \n Printing from Logger \n \n \n")
        Logger.shared.printLogs()
        //Print From CoreData
        print("\n \n \n Printing from CoreData \n \n \n")
        c.printCore()

        //call logger with completion handler
//        Logger.shared.fetchAllLogs { data in
////            print(data[0])
//        }
    }
    
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return (String((0..<length).map{ _ in letters.randomElement()! }))
    }
    
    
}





