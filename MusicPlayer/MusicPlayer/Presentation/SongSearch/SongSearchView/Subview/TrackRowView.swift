import SwiftUI

struct TrackRowView: View
{
    let itemViewModel: SongSearchItemViewModel
    var action: ((SongSearchItemViewModel.Identifier) -> Void)?

    var body: some View
    {
        HStack
        {
            AsyncImage(url: itemViewModel.previewPosterURL)
            { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: previewPosterFrameWidth,
                           height: previewPosterFrameHeight)
                    .clipShape(RoundedRectangle(
                        cornerRadius: previewPosterFrameCornerRadius
                    ))
            }
            placeholder:
            {
                Image(systemName: .SystemImageName.photo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: previewPosterFrameWidth,
                           height: previewPosterFrameHeight)
                    .clipShape(RoundedRectangle(
                        cornerRadius: previewPosterFrameCornerRadius
                    ))
            }

            VStack(alignment: .leading)
            {
                Text(itemViewModel.trackName)
                    .font(.custom(.FontName.MontserratSemiBold,
                                  size: trackNameFontSize))
                    .font(.title2)
                Text(itemViewModel.artistName)
                    .font(.custom(.FontName.MontserratMedium,
                                  size: artistNameFontSize))
                    .foregroundStyle(.semiWhiteApp)
            }

            Spacer()
            Button
            {
                action?(itemViewModel.id)
            } label:
            {
                Image(systemName: .SystemImageName.playFill)
            }
        }
    }

    // MARK: - Private

    private let trackNameFontSize: CGFloat = 16
    private let artistNameFontSize: CGFloat = 13
    private let previewPosterFrameWidth: CGFloat = 64
    private let previewPosterFrameHeight: CGFloat = 64
    private let previewPosterFrameCornerRadius: CGFloat = 15
}

#Preview
{
    TrackRowView(
        itemViewModel: SongSearchItemViewModel(song: Song.Dummy.songs[0])
    )
    .background(.red)
}
