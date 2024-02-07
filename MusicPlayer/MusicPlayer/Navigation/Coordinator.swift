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
            let viewModel = makeSongSearchViewModel()
            SongSearchView(viewModel: viewModel)
        case let .player(withSong: song):
            let viewModel = makePlayerViewModel(with: song)
            PlayerView(viewModel: viewModel)
        }
    }

    // MARK: - Private methods

    private func makePlayerViewModel(with song: Song) -> PlayerViewModel
    {
        PlayerViewModel(song: song, coordinator: self)
    }

    private func makeSongSearchViewModel() -> SongSearchViewModel
    {
        let songsRepo = DefaultSongsRepository(dataTransferService: DefaultDataTransferService())
        let useCase = SongSearchUseCase(songsRepository: songsRepo)
        return SongSearchViewModel(coordinator: self, songSearchUseCase: useCase)
    }
}
