import SwiftUI

struct SongSearchView: View
{
    @State var searchText = ""

    var body: some View
    {
        VStack
        {
            SearchBar(searchText: $searchText)
                .padding()
            TrackList(title: "Title", author: "Author")
        }
        .foregroundStyle(Color.white)
        .background(LinearGradient.background)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview
{
    SongSearchView()
}
