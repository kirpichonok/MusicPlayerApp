import SwiftUI

final class PlayerViewModel: ObservableObject
{
    typealias Second = Int

    // MARK: - Properties

    weak var coordinator: Coordinator?
    let trackName: String
    let artistName: String
    var postersURLs = [URL]()
    var songStartTime: String
    {
        zeroTimePlaceholder
    }

    var songFinishTime: String
    {
        guard let trackTime else { return zeroTimePlaceholder }
        return millisecondsToString(trackTime)
    }

    var isPosterImageHidden: Bool
    {
        postersURLs.isEmpty
    }

    init(song: Song)
    {
        trackName = song.trackName ?? ""
        artistName = song.artistName ?? ""
        trackTime = song.trackTime
        if let posterPath = song.posterPath,
           let url = URL(string: posterPath)
        {
            postersURLs.append(url)
        }
    }

    // MARK: - Private Properties

    private let trackTime: Second?
    private let zeroTimePlaceholder = "0:00"

    // MARK: - Methods
    
    func didBackButtonPressed()
    {
        coordinator?.pop()
    }

    // MARK: - Private Methods

    private func millisecondsToString(_ milliseconds: Int) -> String
    {
        let timeInSeconds = milliseconds / 60000
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}
