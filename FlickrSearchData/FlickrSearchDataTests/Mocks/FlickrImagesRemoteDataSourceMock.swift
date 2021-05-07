//
//  FlickrImagesRemoteDataSourceMock.swift
//  FlickrSearchDataTests
//
//  Created by Mohammed Abd El-Aty on 07/05/2021.
//

import Foundation
@testable import FlickrSearchData
@testable import FlickrSearchDomain

public class FlickrImagesRemoteDataSourceMock: FlickrImagesRemoteDataSourceInterface {
    
    let urlString: String
    
    required public init(urlString: String ) {
        self.urlString = urlString
    }
    
    
    public func searchFlickrImages(with filter: String, page: Int, handler: @escaping (Result<FlickrImagesModel, FlickrSearchError>) -> Void) {
        guard let data = Utils.readLocalFile(forName: urlString) else {
            handler(.failure(FlickrSearchError.NotFound))
            return
        }
        
        guard let result = Utils.parse(jsonData: data) else {
            handler(.failure(FlickrSearchError.WrongData))
            return
        }

        handler(.success(result))
    }
}
