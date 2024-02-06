protocol SongsRepository
{
    func fetchSongs(query: SongSearchQuery) async throws -> [Song]
}
