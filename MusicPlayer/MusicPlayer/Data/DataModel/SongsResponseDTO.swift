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
    init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        songs = try container.decode([SongsResponseDTO.SongDTO].self, forKey: .songs)
    }
}

extension SongsResponseDTO
{
    struct SongDTO: Decodable
    {
        typealias Millisecond = Int
        private enum CodingKeys: String, CodingKey
        {
            case id = "trackId"
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
        let kind: KindDTO?
        let artistName: String?
        let trackName: String?
        let trackTime: Millisecond?
        let previewPosterPath: String?
        let posterPath: String?
    }
}

extension SongsResponseDTO.SongDTO
{
    init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: SongsResponseDTO.SongDTO.CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? Int.random(in: Int.min..<Int.max)
        if let raw = try? container.decodeIfPresent(String.self, forKey: .kind)
        {
            kind = .init(rawValue: raw)
        }
        else
        {
            kind = nil
        }
        artistName = try container.decodeIfPresent(String.self, forKey: .artistName)
        trackName = try container.decodeIfPresent(String.self, forKey: .trackName)
        trackTime = try container.decodeIfPresent(Millisecond.self, forKey: .trackTime)
        previewPosterPath = try container.decodeIfPresent(String.self, forKey: .previewPosterPath)
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
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
             kind: kind?.toDomain(),
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
