//
//  Utils.swift
//  FlickrSearchDataTests
//
//  Created by Mohammed Abd El-Aty on 07/05/2021.
//

import Foundation
@testable import FlickrSearchData

public class Utils {
    
    public static func readLocalFile(forName name: String) -> Data? {
        
        let currentBundle = Bundle(for: self)
        
        do {
            if let bundlePath = currentBundle.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }

        return nil

    }
    
    public static func parse(jsonData: Data) -> FlickrImagesModel? {
        do {
            let decodedData = try JSONDecoder().decode(FlickrImagesModel.self,
                                                       from: jsonData)
            return decodedData
            
        } catch {
            return nil
        }
    }
}
