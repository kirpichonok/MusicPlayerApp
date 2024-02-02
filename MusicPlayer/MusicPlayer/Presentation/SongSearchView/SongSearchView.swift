import SwiftUI

struct SongSearchView: View
{
    @State var searchText = ""

    var body: some View
    {
        ZStack
        {
            LinearGradient.background.ignoresSafeArea()

            VStack
            {
                SearchBar(searchText: $searchText)
                    .padding()
                TrackList(title: "Title", author: "Author")
            }
            .foregroundStyle(Color.whiteApp)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview
{
    SongSearchView()
}
