//
//  FlickrImagesRemoteDataSource.swift
//  FlickrSearchData
//
//  Created by Mohammed Abd El-Aty on 06/05/2021.
//

import FlickrSearchDomain

public protocol FlickrImagesRemoteDataSourceInterface {
    init (urlString: String)
    
    func searchFlickrImages(with filter: String, page: Int, handler: @escaping (Result<FlickrImagesModel, FlickrSearchError>) -> Void)
}

public class FlickrImagesRemoteDataSource: FlickrImagesRemoteDataSourceInterface {
    let urlString: String
    
    required public init(urlString: String ) {
        self.urlString = urlString
    }
    
    public func searchFlickrImages(with filter: String, page: Int, handler: @escaping (Result<FlickrImagesModel, FlickrSearchError>) -> Void) {
        guard let url = URL(string: "\(urlString)&text=\(filter)&page=\(page)") else {
            handler(.failure(FlickrSearchError.NotFound))
            return
        }
        
        let task  = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200...299:
                    break
                case 400:
                    handler(.failure(FlickrSearchError.BadRequest))
                case 404:
                    handler(.failure(FlickrSearchError.NotFound))
                case 500:
                    handler(.failure(FlickrSearchError.InternalServerError))
                default:
                    handler(.failure(FlickrSearchError.InternalServerError))
                }
             }
            
            guard let data = data else {
              if let error = error {
                handler(.failure(FlickrSearchError.UnknownError(message: error.localizedDescription)))
              }
              return
            }

            let decoder = JSONDecoder()
            
            do {
                let result = try decoder.decode(FlickrImagesModel.self, from: data)
                handler(.success(result))
            } catch {
                handler(.failure(FlickrSearchError.WrongData))
            }
        }
        task.resume()
        
    }
}
