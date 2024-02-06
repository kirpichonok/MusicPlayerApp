import Foundation

final class SongSearchUseCase
{
    init(songsRepository: SongsRepository)
    {
        self.songsRepository = songsRepository
    }

    // MARK: - Private properties

    private let songsRepository: SongsRepository

    // MARK: - Methods

    func fetchSongs(by query: SongSearchQuery) async throws -> [Song]
    {
        let songs = try await songsRepository.fetchSongs(query: query)
        return songs
    }
}
