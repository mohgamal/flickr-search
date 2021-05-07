//
//  AppDI.swift
//  FlickrSearch
//
//  Created by Mohammed Abd El-Aty on 07/05/2021.
//

import FlickrSearchPresentation

class AppDI: AppDIInterface {
    
    static let shared = AppDI(appEnvironment: AppEnvironment())
    
    let appEnvironment: AppEnvironment
    
    init (appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }
    
    
    func flickrImagesSearchDependencies() -> FlickrImagesSearchVM {
        let flickrImagesSearchDI = FlickrImagesSearchDI(appEnvironment: appEnvironment)
        
        return flickrImagesSearchDI.flickrSearchDependencies()
    }
}
