import SwiftUI

struct TrackListView: View
{
    @EnvironmentObject var viewModel: SongSearchViewModel
    var action: ((SongSearchItemViewModel.Identifier) -> Void)?
    var body: some View
    {
        List
        {
            ForEach($viewModel.searchResultItems)
            { itemViewModel in
                TrackRowView(itemViewModel: itemViewModel.wrappedValue,
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
    TrackListView()
        .background(.red)
        .environmentObject(DummyData.searchSongViewModel)
}
