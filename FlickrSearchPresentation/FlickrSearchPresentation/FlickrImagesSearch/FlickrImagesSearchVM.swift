//
//  FlickrImagesSearchVM.swift
//  FlickrSearchPresentation
//
//  Created by Mohammed Abd El-Aty on 07/05/2021.
//

import Combine
import FlickrSearchDomain

public class FlickrImagesSearchVM: ObservableObject {

    public let objectWillChange = PassthroughSubject<Void, Never>()

    var error: Error?
    var page = 1
    var pageCount = 0
    var isLoading = false
    var flickrSearchResult: FlickrImagesEntity = FlickrImagesEntity(photos: FlickrImagesEntity.Photos(page: nil, pages: nil, perpage: nil, total: nil, photo: []), stat: nil)

    private var flickrSearchInteractor: FlickrImagesInteractor

    public init(flickrSearchInteractor: FlickrImagesInteractor) {
        self.flickrSearchInteractor = flickrSearchInteractor
    }

    func getFlickrSearchResults(with text: String, page: Int) {
        flickrSearchInteractor.searchFlickrImages(with: text, page: page) { [weak self] flickrSearchResults in
            DispatchQueue.main.async {
                switch flickrSearchResults {
                case let .success(flickrSearchEntity):
                    
                    self?.pageCount = ((Int(flickrSearchEntity.photos?.total ?? "") ?? 0) / 100)
                    if ((Int(flickrSearchEntity.photos?.total ?? "") ?? 0) % 100) > 0 {
                        self?.pageCount += 1
                    }
                    
                    if page == 1 {
                        self?.flickrSearchResult = flickrSearchEntity
                    } else {
                        for item in flickrSearchEntity.photos?.photo ?? [] {
                            self?.flickrSearchResult.photos?.photo?.append(item)
                        }
                    }
                    self?.objectWillChange.send()
                case let .failure(error):
                    self?.error = error
                    self?.objectWillChange.send()
                }
            }
        }
    }
}
