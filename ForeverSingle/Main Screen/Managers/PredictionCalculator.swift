//
//  PredictionCalculator.swift
//  ForeverSingle
//
//  Created by Swasidhant Chowdhury on 09/02/18.
//  Copyright © 2018 Swasidhant Chowdhury. All rights reserved.
//

import Foundation

class PredictionCalculator {
    func calculatePrediction () -> Float {
        var counter = 0
        while counter < 1000 {
            print("loop run count = \(counter)")
            counter += 1
        }
        
        let random = arc4random_uniform(UInt32(100) - UInt32(0) + 1) + 0
        return Float(random)
    }
}
