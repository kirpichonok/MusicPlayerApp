import SwiftUI

final class SongSearchViewModel: ObservableObject
{
    // MARK: - Properties

    weak var coordinator: Coordinator?
    @Published var searchResultItems = [SongSearchItemViewModel]()
    @Published private(set) var errorMessage = ""
    {
        didSet
        {
            print(errorMessage)
        }
    }

    init(coordinator: Coordinator? = nil,
         songSearchUseCase: SongSearchUseCase)
    {
        self.coordinator = coordinator
        self.songSearchUseCase = songSearchUseCase
    }

    // MARK: - Private properties

    private let songSearchUseCase: SongSearchUseCase
    private var songs = [Song]()
    {
        didSet
        {
            searchResultItems = songs.map(SongSearchItemViewModel.init)
        }
    }

    // MARK: - Methods

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

    func searchSong(by query: String)
    {
        guard !query.isEmpty else { return }
        let songSearchQuery = SongSearchQuery(searchQuery: query)
        Task
        {
            await load(songSearchQuery: songSearchQuery)
        }
    }

    // MARK: - Private methods

    private func load(songSearchQuery: SongSearchQuery) async
    {
        do
        {
            let songs = try await songSearchUseCase.fetchSongs(by: songSearchQuery)
            await MainActor.run
            {
                self.songs = songs
            }
        }
        catch
        {
           await handle(error)
        }
    }

    @MainActor private func handle(_ error: Error)
    {
        errorMessage = error.isInternetConnectionError ?
            "No internet connection" :
            "Failed loading songs"
    }
}
