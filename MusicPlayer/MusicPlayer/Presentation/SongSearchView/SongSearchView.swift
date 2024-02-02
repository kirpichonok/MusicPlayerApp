import SwiftUI

struct SongSearchView: View
{
    @EnvironmentObject var coordinator: Coordinator
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
                TrackList(title: "Title",
                          author: "Author",
                          action:
                          {
                              coordinator.push(page: .player)
                          })
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
