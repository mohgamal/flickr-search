//
//  FlickrSearchDI.swift
//  FlickrSearch
//
//  Created by Mohammed Abd El-Aty on 07/05/2021.
//

import FlickrSearchDomain
import FlickrSearchData
import FlickrSearchPresentation

class FlickrImagesSearchDI {
    let appEnvironment: AppEnvironment
    
    init(appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }
    
    func flickrSearchDependencies() -> FlickrImagesSearchVM {
        
        let flickrImagesSearchURL = appEnvironment.baseURL
        
        let flickrImagesSearchRemoteDataSource = FlickrImagesRemoteDataSource(urlString: flickrImagesSearchURL)
        
        let flickrImagesSearchDataRepo = FlickrImagesDataRepo(flickrImagesRemoteDataSource: flickrImagesSearchRemoteDataSource)
        
        let flickrImagesSearchInteractor = FlickrImagesInteractor(flickrImagesDomainRepoInterface: flickrImagesSearchDataRepo)
        
        let flickrImagesSearchVM = FlickrImagesSearchVM(flickrSearchInteractor: flickrImagesSearchInteractor)
        
        return flickrImagesSearchVM
    }
}
