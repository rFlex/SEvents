//
//  SEventTests.swift
//  SEventTests
//
//  Created by Simon CORSIN on 06/11/14.
//  Copyright (c) 2014 Simon CORSIN. All rights reserved.
//

import Cocoa
import XCTest

class SEventTests: XCTestCase {
    
    func testSynchronousInSameQueue() {
        let myEvent = Event<String>()

        var strValue: String?
        
        myEvent += { (str) in strValue = str }
        
        myEvent.notify("hey")
        
        XCTAssertEqual(strValue!, "hey")
    }
    
    func testIsFullyThreadSafe() {
        let myEvent = Event<String>(threadSafe: true)
        let queue = dispatch_queue_create(nil, DISPATCH_QUEUE_SERIAL)
        
        var firstBlock: (() -> Void)?
        var blockId: Int?
        firstBlock = { () in
            if let id = blockId {
                myEvent.remove(id)
                blockId = nil
            } else {
                blockId = myEvent += { (str) in }
            }
            
            dispatch_async(queue, firstBlock!)
        }
        
        let secondQueue = dispatch_queue_create(nil, DISPATCH_QUEUE_SERIAL)

        var block: (() -> Void)?
        block = { () in
            myEvent.notify("wololo")
            
            dispatch_async(secondQueue, block!)
        }

        firstBlock!()
        block!()
        
        NSThread.sleepForTimeInterval(5)
    }
    
    func testCompilesWithAllAvailableParametersLength() {
        let event = Event<String>()
        let event2 = Event2<String, Int>()
        let event3 = Event3<String, Int, Double>()
        let event4 = Event4<String, Int, Double, String>()
        let event5 = Event5<String, Int, Double, String, String>()
        let event6 = Event6<String, Int, Double, String, String, Int>()
        let event7 = Event7<String, Int, Double, String, String, Int, Double>()
        let event8 = Event8<String, Int, Double, String, String, Int, Double, Double>()
        
    }
    
}
