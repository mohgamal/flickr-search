//
//  Utils.swift
//  FlickrSearchPresentation
//
//  Created by Mohammed Abd El-Aty on 07/05/2021.
//

import Foundation

public class Utils {
    
    public static func logRecentSearch(with text: String) {
        let userDefaults = UserDefaults.standard
        var recentSearchsArray = userDefaults.array(forKey: "RecentSearchKey") ?? []

        if recentSearchsArray.count >= 10 {
            recentSearchsArray.remove(at: 0)
        }
        
        recentSearchsArray.append(text)
        userDefaults.setValue(recentSearchsArray, forKey: "RecentSearchKey")
        
    }
    
    public static func getRecewntSearchArray() -> [String] {
        let userDefaults = UserDefaults.standard
        let recentSearchsArray = userDefaults.array(forKey: "RecentSearchKey") ?? []
        return recentSearchsArray as? [String] ?? []
    }
}
