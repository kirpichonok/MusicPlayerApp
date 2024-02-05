import Foundation

struct SongSearchItemViewModel
{
    typealias Identifier = Int
    let id: Identifier
    let artistName: String
    let trackName: String
    let previewPosterURL: URL?

    init(song: Song)
    {
        id = song.id
        artistName = song.artistName ?? ""
        trackName = song.trackName ?? ""
        if let posterPath = song.posterPath
        {
            previewPosterURL = URL(string: posterPath)
        } else {
            previewPosterURL = nil
        }
    }
}

extension SongSearchItemViewModel: Identifiable
{}

