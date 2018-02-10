//
//  APITests.swift
//  ForeverSingleTests
//
//  Created by Swasidhant Chowdhury on 10/02/18.
//  Copyright © 2018 Swasidhant Chowdhury. All rights reserved.
//

import XCTest

class APITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSemaphore() {
        let sepahamore = DispatchSemaphore(value: 0)
        NetworkManager.fetchWeatherData { (dataDict) in
            sepahamore.signal()
            let weattherList = dataDict["list"]
            XCTAssertNotNil(weattherList, "not getting weather list")
        }
        
        let timeout = DispatchTime.now() + DispatchTimeInterval.seconds(5)
        if sepahamore.wait(timeout: timeout) == DispatchTimeoutResult.timedOut {
            XCTFail("timeout")
        }
    }
    
    func testExpectation() {
        let expectation = self.expectation(description: "Download expectation")
        NetworkManager.fetchWeatherData { (dataDict) in
            expectation.fulfill()
        }
        //does not work if you expectation directly from XCTestExpectation
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error, "timed out")
        }
    }
    
    func testWaiter() {
        let expectation = XCTestExpectation.init(description: "DOwnload expectation")
        let expectation2 = XCTestExpectation.init(description: "DOwnload expectation")

        NetworkManager.fetchWeatherData { (dataDict) in
            expectation.fulfill()
        }
        
        let result = XCTWaiter.wait(for: [expectation,expectation2], timeout: 5)
        XCTAssertEqual(result, .completed, "some error")
    }
    
}
