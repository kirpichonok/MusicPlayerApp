import Foundation

struct Song: Identifiable, Hashable
{
    typealias Identifier = Int
    typealias Millisecond = Int
    enum Kind
    {
        case song
    }

    let id: Identifier
    let trackName: String?
    let artistName: String?
    let kind: Kind?
    let trackTime: Millisecond?
    let previewPosterPath: String?
    let posterPath: String?
}

extension Song
{
    enum Dummy
    {
        static let songs = [
        Song(
            id: 1111,
            trackName: "My name is",
            artistName: "Eminem",
            kind: .song,
            trackTime: 50000,
            previewPosterPath: "https://is1-ssl.mzstatic.com/image/thumb/Music6/v4/79/33/e9/7933e93b-0354-9c10-6c7a-c280552d390c/mzi.imndwlmp.jpg/60x60bb.jpg",
            posterPath: "https://is1-ssl.mzstatic.com/image/thumb/Music/43/b2/d4/mzi.hqnwtruw.jpg/100x100bb.jpg"
        ),
        Song(
            id: 2222,
            trackName: "My name is",
            artistName: "Eminem",
            kind: .song,
            trackTime: 50000,
            previewPosterPath: "https://is1-ssl.mzstatic.com/image/thumb/Music6/v4/79/33/e9/7933e93b-0354-9c10-6c7a-c280552d390c/mzi.imndwlmp.jpg/60x60bb.jpg",
            posterPath: "https://is1-ssl.mzstatic.com/image/thumb/Music/43/b2/d4/mzi.hqnwtruw.jpg/100x100bb.jpg"
        ),
        Song(
            id: 3333,
            trackName: "My name is",
            artistName: "Eminem",
            kind: .song,
            trackTime: 50000,
            previewPosterPath: "https://is1-ssl.mzstatic.com/image/thumb/Music6/v4/79/33/e9/7933e93b-0354-9c10-6c7a-c280552d390c/mzi.imndwlmp.jpg/60x60bb.jpg",
            posterPath: "https://is1-ssl.mzstatic.com/image/thumb/Music/43/b2/d4/mzi.hqnwtruw.jpg/100x100bb.jpg"
        ),
        ]
    }
}

