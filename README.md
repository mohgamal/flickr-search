# Flickr Search

## iOS App for search in Flickr images network

### App could be opened from FlickrSearch.xcworkspace , no third party used.


## There was a bug just happened with the app which cannot decode the data from the remote server 

### There was a field (total) in the photos list model which holds the total count of the result and this was String data type when started to work on the task but for some reason now this returns as Int value.

what I've done to solve this issue that I create a new value type wrapper for this particular element and check for the coming result whether it's String or Int value when decoding the value. and this solved the issue and the commit has been pushed to the repo

```swift
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
```

### Then I updated my entity and the mode total data type to conform to the new type

```swift
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
```
Below is screen recording from the final app:

https://user-images.githubusercontent.com/6039137/117449844-bb4bb200-af40-11eb-9370-74eee110ee32.mov
