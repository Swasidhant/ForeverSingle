//
//  NetworkManager.swift
//  ForeverSingle
//
//  Created by Swasidhant Chowdhury on 09/02/18.
//  Copyright © 2018 Swasidhant Chowdhury. All rights reserved.
//

import Foundation


class NetworkManager {
    class func fetchWeatherData (completionHandler: @escaping ([AnyHashable: Any]) -> Void) {
        let url = "http://api.openweathermap.org/data/2.5/forecast?id=1277333&APPID=2b99ff309c523ae1e074d42dd45a6b4f"
        let request = URLRequest.init(url: URL.init(string: url)!)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            let dataDict = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [AnyHashable: Any]
            print(dataDict)
            completionHandler(dataDict)
        }
        task.resume()
    }
}
