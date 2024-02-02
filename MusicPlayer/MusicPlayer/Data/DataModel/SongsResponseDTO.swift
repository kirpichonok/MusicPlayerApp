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
        private enum CodingKeys: String, CodingKey
        {
            case id
            case kind
            case artistName
            case trackName
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
        let previewPosterPath: String?
        let posterPath: String?
    }
}
