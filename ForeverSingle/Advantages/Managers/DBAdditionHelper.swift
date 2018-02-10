//
//  AddingToDBManager.swift
//  ForeverSingle
//
//  Created by Swasidhant Chowdhury on 07/02/18.
//  Copyright © 2018 Swasidhant Chowdhury. All rights reserved.
//

import Foundation

class DBAdditonHelper {
    class func parseAndAddToCoreData() {
        let filePath = Bundle.main.url(forResource: "AdvantagesDataFile", withExtension: "json")
        let data = try! Data(contentsOf: filePath!)
        
        let dataArray = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [[String: String]]
        
        let coreDataManager = CoreDataManager()
        for element in dataArray {
            coreDataManager.addNewAdvantage(desc: element["desc"]!)
        }
        coreDataManager.save()
    }
}
