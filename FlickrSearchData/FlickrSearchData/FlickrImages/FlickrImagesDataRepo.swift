//
//  FlickrImagesDataRepo.swift
//  FlickrSearchData
//
//  Created by Mohammed Abd El-Aty on 06/05/2021.
//

import FlickrSearchDomain

public class FlickrImagesDataRepo: FlickrImagesDomainRepoInterface {
    
    let flickrImagesRemoteDataSource: FlickrImagesRemoteDataSourceInterface
    
    public init (flickrImagesRemoteDataSource: FlickrImagesRemoteDataSourceInterface) {
        self.flickrImagesRemoteDataSource = flickrImagesRemoteDataSource
    }
    
    public func searchFlickrImages(with filter: String, page: Int, handler: @escaping (Result<FlickrImagesEntity, FlickrSearchError>) -> Void) {
        flickrImagesRemoteDataSource.searchFlickrImages(with: filter, page: page) { flickrImagesResultModel in
            switch flickrImagesResultModel {
            case .success(let flickrImagesModel):
                let flickrImagesEntity = FlickrImagesEntity(photos: flickrImagesModel.photos?.dotPhotos(), stat: flickrImagesModel.stat)
                handler(.success(flickrImagesEntity))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
