//
//  EventHubTests.swift
//  EventHubTests
//
//  Created by Wassim on 4/28/17.
//  Copyright © 2017 Wassim. All rights reserved.
//

import XCTest
@testable import EventHub

class EventHubTests: XCTestCase {
    
    struct userEvents {
        static let didLogin = Event<String>(withName: "didLogin")
    }
    override func setUp() {
        super.setUp()
        let sharedHub = Hub()
        var observer = sharedHub.listen(userEvents.didLogin) { (username) in
            XCTAssert(username == "wassimseif")
            print(username)
        }
        sharedHub.notifyObservers(toEvent: userEvents.didLogin, "wassimseif")
        
        observer.remove()
        
        sharedHub.notifyObservers(toEvent: userEvents.didLogin, "shouldNotBeObseved")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
