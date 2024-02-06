import Foundation

protocol DataTransferService {
    func fetch<T: Decodable>(from endpoint: ApiEndpoint) async throws -> T
}
