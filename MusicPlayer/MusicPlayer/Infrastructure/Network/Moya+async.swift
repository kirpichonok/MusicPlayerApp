import Moya

extension MoyaProvider
{
    func request(_ target: Target) async throws -> Response
    {
        return try await withCheckedThrowingContinuation
        { continuation in
            request(target)
            { result in
                switch result
                {
                case let .success(response):
                    continuation.resume(returning: response)
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
