import Foundation

enum DataTransferError: Error
{
    case noResponse
    case urlGenerationFailure
    case parsing(Error)
    case notConnected
    case networkFailure
    case resolvedNetworkFailure(Error)
    case generic(Error)
}
