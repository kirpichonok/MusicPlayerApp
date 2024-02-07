import Foundation
import Moya

extension ApiEndpoint: TargetType
{
    var baseURL: URL
    {
        switch self
        {
        case let .image(url: url):
            return url
        case .song:
            return URL(string: "https://itunes.apple.com/search")!
        }
    }

    var path: String
    {
        ""
    }

    var method: Moya.Method
    {
        .get
    }

    var task: Moya.Task
    {
        switch self
        {
        case .image:
            return .requestPlain
        case let .song(query: songSearchQuery):
            return .requestParameters(parameters: ["term": songSearchQuery.searchQuery],
                                      encoding: URLEncoding.default)
        }
    }

    var headers: [String: String]?
    {
        nil
    }
}
