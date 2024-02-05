import SwiftUI

struct SongSearchView: View
{
    @State var searchText = ""
    @StateObject var viewModel: SongSearchViewModel

    var body: some View
    {
        ZStack
        {
            LinearGradient.background.ignoresSafeArea()

            VStack
            {
                SearchBarView(searchText: $searchText)
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
        .onAppear
        {
            viewModel.updateItems()
        }
    }
}

#Preview
{
    SongSearchView(viewModel: SongSearchViewModel())
}
