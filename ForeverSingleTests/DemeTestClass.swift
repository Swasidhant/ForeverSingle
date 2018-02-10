//
//  DemeTestClass.swift
//  ForeverSingleTests
//
//  Created by Swasidhant Chowdhury on 10/02/18.
//  Copyright © 2018 Swasidhant Chowdhury. All rights reserved.
//

import XCTest

class DemeTestClass: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let result = PredictionCalculator().calculatePrediction()
        let failure = result > 100.0
        
        if failure {
            XCTFail("returning results greater than 100")
        }

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            let result = PredictionCalculator().calculatePrediction()
            let failure = result > 100.0
            
            if failure {
                XCTFail("returning results greater than 100")
            }
        }
    }
    
}
