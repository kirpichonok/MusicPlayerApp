import Foundation

final class DefaultSongsRepository: SongsRepository
{
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
    
    private let dataTransferService: DataTransferService

    func fetchSongs(query: SongSearchQuery) async throws -> [Song]
    {
        let result: SongsResponseDTO = try await dataTransferService.fetch(from: .song(query: query))
        
        return result.toDomain()
    }
}
