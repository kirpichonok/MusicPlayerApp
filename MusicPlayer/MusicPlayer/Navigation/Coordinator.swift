import SwiftUI

final class Coordinator: ObservableObject
{
    @Published var path = NavigationPath()

    // MARK: - Methods

    func push(page: Page)
    {
        path.append(page)
    }

    func pop()
    {
        path.removeLast()
    }

    func popToRoot()
    {
        path.removeLast(path.count)
    }

    @ViewBuilder func build(_ page: Page) -> some View
    {
        switch page
        {
        case .songSearch:
            let viewModel = SongSearchViewModel(coordinator: self)
            SongSearchView(viewModel: viewModel)
        case let .player(withSong: song):
            let viewModel = makePlayerViewModel(with: song)
            PlayerView(viewModel: viewModel)
        }
    }

    // MARK: - Private methods

    private func makePlayerViewModel(with song: Song) -> PlayerViewModel
    {
        PlayerViewModel(song: song)
    }
}
