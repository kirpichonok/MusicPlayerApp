import Foundation
import Moya

final class DefaultDataTransferService: DataTransferService
{
    // MARK: - Methods

    func fetch<T>(from endpoint: ApiEndpoint) async throws -> T where T: Decodable
    {
        try await request(endpoint)
    }

    // MARK: - Private properties
    
    private let moyaProvider = MoyaProvider<ApiEndpoint>()
    
    // MARK: - Private methods

    private func request<T: Decodable>(_ target: ApiEndpoint) async throws -> T
    {
        do
        {
           let response = try await moyaProvider.request(target)
            
            return try target.responseDecoder.decode(T.self, from: response.data)
        }
        catch
        {
            throw mapToDataTransferError(error)
        }
    }

    private func mapToDataTransferError(_ error: Error) -> DataTransferError
    {
        guard let moyaError = error as? MoyaError else { return .generic(error) }
        switch moyaError
        {
        case let .underlying(underlyingError, _):
            return mapUnderlyingError(underlyingError)
        case let .objectMapping(error, _):
            return .parsing(error)
        case .requestMapping, .parameterEncoding:
            return .urlGenerationFailure
        default:
            return .generic(error)
        }
    }

    private func mapUnderlyingError(_ error: Error) -> DataTransferError
    {
        let error = error as NSError
        guard error.domain == NSURLErrorDomain else { return .generic(error) }
        switch error.code
        {
        case NSURLErrorNotConnectedToInternet, NSURLErrorNetworkConnectionLost:
            return .notConnected
        case NSURLErrorCannotConnectToHost, NSURLErrorCannotFindHost:
            return .networkFailure
        default:
            return .generic(error)
        }
    }
}
