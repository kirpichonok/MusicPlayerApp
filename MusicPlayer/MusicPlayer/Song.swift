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
