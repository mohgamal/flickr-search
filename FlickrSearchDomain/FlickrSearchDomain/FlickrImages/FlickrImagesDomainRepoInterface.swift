//
//  FlickrImagesDomainRepoInterface.swift
//  FlickrSearchDomain
//
//  Created by Mohammed Abd El-Aty on 06/05/2021.
//

import Foundation

public protocol FlickrImagesDomainRepoInterface {
    func searchFlickrImages(with filter: String, handler: @escaping (Result<FlickrImagesEntity, FlickrSearchError>) -> Void)
}
