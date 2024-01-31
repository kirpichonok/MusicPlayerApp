import SwiftUI

struct TrackList: View
{
    var imageURL: URL?
    var title: String
    var author: String
    var action: (() -> Void)?
    var body: some View
    {
        List
        {
            ForEach(0...1, id: \.self)
            { index in
                TrackRow(imageURL: imageURL,
                         title: "Track \(index)",
                         author: author,
                         action: action)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
    }
}

#Preview
{
    TrackList(title: "Title", author: "Author")
}
