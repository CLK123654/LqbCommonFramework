//
//  URL+Extension.swift
//  common
//
//  Created by togreat on 2021/9/6.
//

import UIKit

extension URL {
    public func queryStringComponents() -> [String: AnyObject] {

        var dict = [String: AnyObject]()

        // Check for query string
        if let query = self.query {

            // Loop through pairings (separated by &)
            for pair in query.components(separatedBy: "&") {

                // Pull key, val from from pair parts (separated by =) and set dict[key] = value
                let components = pair.components(separatedBy: "=")
                if (components.count > 1) {
                    dict[components[0]] = components[1] as AnyObject?
                }
            }

        }

        return dict
    }
    
    public func params() -> [String:String] {
       var dict = [String:String]()

       if let components = URLComponents(url: self, resolvingAgainstBaseURL: false) {
         if let queryItems = components.queryItems {
           for item in queryItems {
             dict[item.name] = item.value!
           }
         }
         return dict
       } else {
         return [:]
       }
     }
}
