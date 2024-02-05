import SwiftUI

final class SongSearchViewModel: ObservableObject
{
    // MARK: - Properties

    weak var coordinator: Coordinator?
    @Published var searchResultItems = [SongSearchItemViewModel]()

    init(coordinator: Coordinator? = nil)
    {
        self.coordinator = coordinator
    }

    // MARK: - Private properties

    private var songs = [Song]()
    {
        didSet
        {
            searchResultItems = songs.map(SongSearchItemViewModel.init)
        }
    }

    // MARK: - Methods

    func updateItems()
    {
        songs = Song.Dummy.songs
    }

    func didSelectItem(with id: SongSearchItemViewModel.Identifier)
    {
        if let song = songs.first(where: { $0.id == id })
        {
            coordinator?.push(page: .player(withSong: song))
        }
        else
        {
            assertionFailure("ID matching error. Song list doesn't contain element with id: \(id).")
        }
    }
}
