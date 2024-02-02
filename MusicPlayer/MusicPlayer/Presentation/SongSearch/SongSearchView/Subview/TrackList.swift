import SwiftUI

struct TrackList: View
{
    @State var searchListItems: [SongSearchItemViewModel]
    var action: (() -> Void)?
    var body: some View
    {
        List
        {
            ForEach($searchListItems)
            { itemViewModel in
                TrackRow(itemViewModel: itemViewModel.wrappedValue, action: action)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
    }
}

#Preview
{
    TrackList(
        searchListItems: [
            SongSearchItemViewModel.DummyData.itemsViewModel[0],
        ]
    )
    .background(.red)
}
