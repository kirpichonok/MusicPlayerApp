import Foundation

struct SongSearchItemViewModel
{
    let id = UUID()
    let artistName: String
    let trackName: String
    let previewPosterURL: URL?
}

extension SongSearchItemViewModel: Identifiable
{}

extension SongSearchItemViewModel
{
    enum DummyData
    {
        static let itemsViewModel = [
            SongSearchItemViewModel(
                artistName: "The Notorious B.I.G.",
                trackName: "Dead Wrong (feat. Eminem) [2007 Remaster]",
                previewPosterURL: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Features115/v4/70/0a/b8/700ab8a1-e07a-8ac9-369f-9b847ed9299d/dj.qkvadrjz.jpg/60x60bb.jpg")
            ),
            SongSearchItemViewModel(
                artistName: "The Notorious B.I.G.",
                trackName: "Dead Wrong (feat. Eminem) [2007 Remaster]",
                previewPosterURL: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Features115/v4/70/0a/b8/700ab8a1-e07a-8ac9-369f-9b847ed9299d/dj.qkvadrjz.jpg/60x60bb.jpg")
            ),
            SongSearchItemViewModel(
                artistName: "The Notorious B.I.G.",
                trackName: "Dead Wrong (feat. Eminem) [2007 Remaster]",
                previewPosterURL: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Features115/v4/70/0a/b8/700ab8a1-e07a-8ac9-369f-9b847ed9299d/dj.qkvadrjz.jpg/60x60bb.jpg")
            ),
        ]
    }
}
