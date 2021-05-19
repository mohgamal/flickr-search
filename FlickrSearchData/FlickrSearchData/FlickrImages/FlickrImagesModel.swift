//
//  FlickrImagesModel.swift
//  FlickrSearchData
//
//  Created by Mohammed Abd El-Aty on 06/05/2021.
//

import FlickrSearchDomain

public struct FlickrImagesModel: Codable {

    public let photos: Photos?
    public let stat: String?

    public func dotFlickrImages() -> FlickrImagesEntity {
        return FlickrImagesEntity(photos: photos?.dotPhotos(), stat: stat)
    }

    public struct Photos: Codable {
        public let page: Int?
        public let pages: Int?
        public let perpage: Int?
        public let total: FlickrSearchDomain.DynamicFiledType?
        public let photo: [Photo]?

        func dotPhotos() -> FlickrImagesEntity.Photos {
            var photosList: [FlickrImagesEntity.Photo] = []
            for singlePhoto in photo ?? [] {
                photosList.append(singlePhoto.dotPhoto())
            }
            return FlickrImagesEntity.Photos(page: page, pages: pages, perpage: perpage, total: total, photo: photosList)
        }
    }

    public struct Photo: Codable {
        public let id: String?
        public let owner: String?
        public let secret: String?
        public let server: String?
        public let farm: Int?
        public let title: String?
        public let ispublic: Int?
        public let isfriend: Int?
        public let isfamily: Int?

        func dotPhoto() -> FlickrImagesEntity.Photo {
            return FlickrImagesEntity.Photo(id: id, owner: owner, secret: secret, server: server,
                                            farm: farm, title: title, ispublic: ispublic, isfriend: isfriend, isfamily: isfamily)
        }
    }
}
