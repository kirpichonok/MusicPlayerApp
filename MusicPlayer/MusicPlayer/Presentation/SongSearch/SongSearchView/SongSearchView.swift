import SwiftUI

struct SongSearchView: View
{
    @State var searchText = ""
    @StateObject var viewModel: SongSearchViewModel

    var body: some View
    {
        ZStack
        {
            BackgroundView()

            VStack
            {
                SearchBarView(searchText: $searchText, onSearchTapAction: viewModel.searchSong(by:))
                    .padding()
                TrackListView(action:
                    { id in
                        viewModel.didSelectItem(with: id)
                    })
                .environmentObject(viewModel)
            }
            .foregroundStyle(Color.whiteApp)
            .toolbar(.hidden, for: .navigationBar)
        }
        .onTapGesture
        {
            hideKeyboard()
        }
    }
}

#Preview
{
    SongSearchView(viewModel: DummyData.searchSongViewModel)
}
