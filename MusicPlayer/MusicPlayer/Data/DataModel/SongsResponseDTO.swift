import Foundation

struct SongsResponseDTO: Decodable
{
    private enum CodingKeys: String, CodingKey
    {
        case songs = "results"
    }

    let songs: [SongDTO]
}

extension SongsResponseDTO
{
    struct SongDTO: Decodable
    {
        typealias Millisecond = Int
        private enum CodingKeys: String, CodingKey
        {
            case id
            case kind
            case artistName
            case trackName
            case trackTime = "trackTimeMillis"
            case previewPosterPath = "artworkUrl60"
            case posterPath = "artworkUrl100"
        }

        enum KindDTO: String, Decodable
        {
            case song
        }

        let id: Int
        let kind: KindDTO
        let artistName: String?
        let trackName: String?
        let trackTime: Millisecond
        let previewPosterPath: String?
        let posterPath: String?
    }
}

extension SongsResponseDTO
{
    func toDomain() -> [Song]
    {
        songs.map { $0.toDomain() }
    }
}

extension SongsResponseDTO.SongDTO
{
    func toDomain() -> Song
    {
        Song(id: id,
             trackName: trackName,
             artistName: artistName,
             kind: kind.toDomain(),
             trackTime: trackTime,
             previewPosterPath: previewPosterPath,
             posterPath: posterPath)
    }
}

extension SongsResponseDTO.SongDTO.KindDTO
{
    func toDomain() -> Song.Kind
    {
        switch self
        {
        case .song: return .song
        }
    }
}
