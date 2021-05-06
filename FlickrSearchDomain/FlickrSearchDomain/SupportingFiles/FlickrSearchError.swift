//
//  FlickrSearchError.swift
//  FlickrSearchDomain
//
//  Created by Mohammed Abd El-Aty on 06/05/2021.
//

import Foundation

public enum FlickrSearchError: Error {
    case BadRequest
    case NotFound
    case WrongData
    case InternalServerError
    case UnknownError(message: String)
}

extension FlickrSearchError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .BadRequest:
            return "A bad request sent to the instance"
        case .NotFound:
            return "No data found using this request"
        case .WrongData:
            return "Error when reading data from remote instance"
        case .InternalServerError:
            return "Internal Server Error"
        case .UnknownError(let message):
            return message
        }
    }
}
