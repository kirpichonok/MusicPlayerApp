import SwiftUI

final class SongSearchViewModel: ObservableObject
{
    @Published var searchResultItems: [SongSearchItemViewModel] = SongSearchItemViewModel.DummyData.itemsViewModel
}
