//
//  DemoAppTests.swift
//  DemoAppTests
//
//  Created by Yassin Nawar on 27/06/2022.
//


import XCTest
@testable import Logger

class InstabugLoggerTests: XCTestCase {

    //testing saving latest 1000 log only
    func testLastMessage() throws {
        let numberOfLogs = 2000;
        let maxStringLength = 1500;
        var lastMessage = "";
        for i in 1...numberOfLogs {
            
            let string = randomString(length: Int.random(in: 1..<maxStringLength))
            let message = "This is log [\(i)] \(string)"
            let level = Int.random(in: 1..<4)
            Logger.shared.log(level, message: message)
            
            if(i==numberOfLogs){
                if(message.count>1000)
                {
                    let dots = "..."
                    lastMessage = String(message.prefix(1000) +  dots)
                }
                else {
                    lastMessage = message
                }
            }
            
        }
        
        XCTAssertEqual(lastMessage,Logger.queue.getmessageAtIndex(i: 999))
//        print(InstabugLogger.queue.getmessageAtIndex(i: 999))
    }
    
    
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return (String((0..<length).map{ _ in letters.randomElement()! }))
    }
    
    
    
    
    func testLongMessages() throws {

        let longMessage = randomString(length: 5000)
        Logger.shared.log(2, message: longMessage)
        let dots = "..."
        let newMessage = String(longMessage.prefix(1000) + dots)
        
        // will compare first 1000 charachters + 3 dot with the last message saved in log
        XCTAssertEqual(newMessage,Logger.queue.getmessageAtIndex(i: 999))
//        print(newMessage)
//        print(InstabugLogger.queue.getmessageAtIndex(i: 999))
       
}

}

