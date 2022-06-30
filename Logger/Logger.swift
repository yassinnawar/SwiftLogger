//
//  logger.swift
//  Logger
//
//  Created by Yassin Nawar on 27/06/2022.
//

import Foundation



public class Logger {
    public static var shared = Logger()
    public static var queue = Queue()
    public var count = 0;
    public var longMessagesCount = 0;
    
    //SINGELTON
    private init() {
    }
    

    // MARK: Logging
    public func log(_ level: Int, message: String) {
        let symbol = getLevel(x: level)
        let newMessage = editMessage(message: message)
        Logger.queue.enqueue(message: newMessage, level: symbol)
        count+=1;
    }
    
    func editMessage(message:String) -> String {
        if (message.count>1000)
        {
            let dots = "..."
            let newMessage = message.prefix(1000) +  dots
            longMessagesCount+=1
//            print(newMessage.count)
            return (String(newMessage))
        }
        else {
            return message
        }
    }
    
    
    func getLevel(x:Int) -> String {
        var s:String = "not specified or UNKNOWN";
        if(x == 1) {
            s = "Note"
        }
        else if(x == 2) {
            s = "Warning"
        }
        else {
            s = "Error"
        }
        return s;
    }
    
    // MARK: Fetch logs
    public func fetchAllLogs() -> Queue {
        return (Logger.queue)
    }
    

    public func fetchAllLogs(completionHandler: ([(String, String)])->Void) {
        let logs = fetchAllLogs();
        completionHandler(logs.items)
    }
    
    
    
    // PRINTING
    public func printLogs(){
        let log = Logger.queue.returnLog()
        for i in 0..<log.count {
            print(log[i])
        }
        print("Number of logs saved = \(log.count)")
        print("Total Number of Logs passed: \(self.count)")
        print("Number of logs>1000: \(self.longMessagesCount)")
    }
    

    public func PrintLevels(){
        let log = Logger.queue.returnLog()
        for i in 0..<log.count {
            print("Level of log \(i) =: \(log[i].0)")
        }
        
    }
    
    public func PrintMessages(){
        let log = Logger.queue.returnLog()
        for i in 0..<log.count {
            print("Message of log \(i) =: \(log[i].1)")
        }
        
    }
    
    
}

