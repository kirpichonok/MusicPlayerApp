import SwiftUI

struct TrackList: View
{
    @EnvironmentObject var viewModel: SongSearchViewModel
    var action: ((SongSearchItemViewModel.Identifier) -> Void)?
    var body: some View
    {
        List
        {
            ForEach($viewModel.searchResultItems)
            { itemViewModel in
                TrackRow(itemViewModel: itemViewModel.wrappedValue,
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
    TrackList(    )
    .background(.red)
    .environmentObject(SongSearchViewModel())
}
