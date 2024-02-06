import Foundation

final class DefaultDataTransferService: DataTransferService {
    func fetch<T>(from endpoint: ApiEndpoint) async throws -> T where T : Decodable {
        return SongsResponseDTO(from: Song.Dummy.songs) as! T
    }
}
