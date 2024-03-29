import Foundation

enum ApiEndpoint {
    case song(query: SongSearchQuery)
    case image(url: URL)
}

extension ApiEndpoint {
    var responseDecoder: JSONDecoder {
        switch self {
            case .song, .image:
                return JSONDecoder()
        }
    }
}
