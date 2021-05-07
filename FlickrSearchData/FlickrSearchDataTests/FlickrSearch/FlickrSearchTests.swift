//
//  FlickrSearchTests.swift
//  FlickrSearchDataTests
//
//  Created by Mohammed Abd El-Aty on 07/05/2021.
//

import XCTest
@testable import FlickrSearchDomain

class FlickrSearchTests: XCTestCase {

    var flickrSearchRemoteDataSource: FlickrImagesRemoteDataSourceMock?
    
    override func setUpWithError() throws {
        self.flickrSearchRemoteDataSource = FlickrImagesRemoteDataSourceMock(urlString: "flickr-test")
    }

    override func tearDownWithError() throws {
        self.flickrSearchRemoteDataSource = nil
    }
    
    func testCanDecodeData() {
        let requestExpectation = expectation(description: "Request should finish")
        
        self.flickrSearchRemoteDataSource?.searchFlickrImages(with: "Flowers", page: 1, handler: { (result) -> Void in
            switch result {
            case .success(let resultModel):
                XCTAssertTrue(resultModel.photos?.photo?.count ?? 0 > 0)
                requestExpectation.fulfill()
            case .failure(_): break
            }
        })
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testSearchNotFoundResult() {
        let requestExpectation = expectation(description: "Request should finish")
        let searchFilter = "Dogs"
        self.flickrSearchRemoteDataSource?.searchFlickrImages(with: "Flowers", page: 1, handler: { (result) -> Void in
            switch result {
            case .success(let resultModel):
                let foundResult = resultModel.photos?.photo?.first(where: { $0.title?.contains(searchFilter) as! Bool})
                XCTAssertTrue(foundResult == nil)
                requestExpectation.fulfill()
            case .failure(_): break
            }
        })
        
        waitForExpectations(timeout: 10, handler: nil)
    }

}
