import Foundation

enum DummyData
{
    static let imageURL = URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music6/v4/79/33/e9/7933e93b-0354-9c10-6c7a-c280552d390c/mzi.imndwlmp.jpg/60x60bb.jpg")!
    static let imageURLs = [
        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music6/v4/79/33/e9/7933e93b-0354-9c10-6c7a-c280552d390c/mzi.imndwlmp.jpg/60x60bb.jpg")!,
        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music/43/b2/d4/mzi.hqnwtruw.jpg/100x100bb.jpg")!,
        URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/2c/b0/de/2cb0de7b-4559-d885-36f8-271c950cba34/886443562097.jpg/100x100bb.jpg")!,
    ]
    
    static let searchSongViewModel: SongSearchViewModel =  {
        let songsRepo = DefaultSongsRepository(dataTransferService: DefaultDataTransferService())
        let useCase = SongSearchUseCase(songsRepository: songsRepo)
        let viewModel = SongSearchViewModel(songSearchUseCase: useCase)
        viewModel.searchSong(by: "any")
        return viewModel
    }()
}

extension SongsResponseDTO
{
    init(from songs: [Song])
    {
        let songDTOs = songs.map
        { SongDTO(id: $0.id,
                  kind: .song,
                  artistName: $0.artistName,
                  trackName: $0.trackName,
                  trackTime: $0.trackTime ?? 0,
                  previewPosterPath: $0.previewPosterPath,
                  posterPath: $0.posterPath)
        }
        self.init(songs: songDTOs)
    }
}
