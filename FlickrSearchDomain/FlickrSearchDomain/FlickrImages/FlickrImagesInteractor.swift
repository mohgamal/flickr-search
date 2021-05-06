//
//  FlickrImagesInteractor.swift
//  FlickrSearchDomain
//
//  Created by Mohammed Abd El-Aty on 06/05/2021.
//

import Foundation

public protocol FlickrImagesInteractorInterface {
    func searchFlickrImages(with filter: String, handler: @escaping (Result<FlickrImagesEntity, FlickrSearchError>) -> Void)
}

public class FlickrImagesInteractor: FlickrImagesInteractorInterface {
    
    let flickrImagesDomainRepoInterface: FlickrImagesDomainRepoInterface
    
    public init (flickrImagesDomainRepoInterface: FlickrImagesDomainRepoInterface) {
        self.flickrImagesDomainRepoInterface = flickrImagesDomainRepoInterface
    }
    
    public func searchFlickrImages(with filter: String, handler: @escaping (Result<FlickrImagesEntity, FlickrSearchError>) -> Void) {
        flickrImagesDomainRepoInterface.searchFlickrImages(with: filter) { flickrImagesDomainModel in
            handler(flickrImagesDomainModel)
        }
    }
}
