import Foundation

protocol NetworkService {
    func request(from endpoint: ApiEndpoint) async throws -> Data
}
