import SwiftUI

struct SongSearchView: View
{
    @EnvironmentObject var coordinator: Coordinator
    @State var searchText = ""
    @StateObject var viewModel = SongSearchViewModel()

    var body: some View
    {
        ZStack
        {
            LinearGradient.background.ignoresSafeArea()

            VStack
            {
                SearchBar(searchText: $searchText)
                    .padding()
                TrackList(searchListItems: viewModel.searchResultItems,
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
    SongSearchView(viewModel: SongSearchViewModel())
}
