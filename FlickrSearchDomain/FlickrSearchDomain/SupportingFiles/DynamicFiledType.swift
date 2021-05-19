//
//  DynamicFiledType.swift
//  FlickrSearchDomain
//
//  Created by Mohammed Abd El-Aty on 19/05/2021.
//

import Foundation

public enum DynamicFiledType: Codable {
  case int(Int)
  case string(String)

    public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    do {
      self = try .int(container.decode(Int.self))
    } catch DecodingError.typeMismatch {
      do {
        self = try .string(container.decode(String.self))
      } catch DecodingError.typeMismatch {
        throw DecodingError.typeMismatch(DynamicFiledType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Encoded payload not of an expected type"))
      }
    }
  }

    public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    switch self {
    case .int(let int):
      try container.encode(int)
    case .string(let string):
      try container.encode(string)
    }
  }
}
