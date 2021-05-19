//
//  FlickrImagesEntity.swift
//  FlickrSearchDomain
//
//  Created by Mohammed Abd El-Aty on 06/05/2021.
//

import Foundation

public struct FlickrImagesEntity: Codable {
    public var photos: Photos?
    public let stat: String?

    public init(photos: Photos?, stat: String?) {
        self.photos = photos
        self.stat = stat
    }

    public struct Photos: Codable {
        public var page: Int?
        public let pages: Int?
        public let perpage: Int?
        public let total: DynamicFiledType?
        public var photo: [Photo]?

        public init(page: Int?, pages: Int?, perpage: Int?, total: DynamicFiledType?, photo: [Photo]?) {
            self.page = page
            self.pages = pages
            self.perpage = perpage
            self.total = total
            self.photo = photo
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

        public init(id: String?, owner: String?, secret: String?, server: String?,
                    farm: Int?, title: String?, ispublic: Int?, isfriend: Int?, isfamily: Int?) {
            self.id = id
            self.owner = owner
            self.secret = secret
            self.server = server
            self.farm = farm
            self.title = title
            self.ispublic = ispublic
            self.isfriend = isfriend
            self.isfamily = isfamily
        }
    }
}
