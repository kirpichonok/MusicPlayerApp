import SwiftUI

struct PlayerView: View
{
    // MARK: - Properties

    @StateObject private var viewModel: PlayerViewModel
    var body: some View
    {
        ZStack
        {
            LinearGradient.background.ignoresSafeArea()

            VStack
            {
                ImageCarouselView(imageWidth: carouselWidth,
                                  imageHeight: carouselHeight,
                                  imagesURLs: viewModel.postersURLs)
                    .padding(.top, carouselTopOffset)

                SongTitleView(artistName: viewModel.artistName,
                              trackName: viewModel.trackName)

                Group
                {
                    Spacer()

                    PlayerTrackView(sliderValue: $sliderValue,
                                    songStartTime: viewModel.songStartTime,
                                    songFinishTime: viewModel.songFinishTime)

                    Spacer()

                    PlayerButtonsView()

                    Spacer()
                }
                .frame(width: carouselWidth)
            }
        }
        .toolbar
        {
            ToolbarItem(placement: .navigationBarLeading)
            {
                Button
                {
                    viewModel.didBackButtonPressed()
                }
                label: {
                    Image(systemName: .SystemImageName.chevronBackward)
                        .padding(10)
                        .foregroundStyle(.whiteApp)
                        .background(.whiteApp.opacity(0.3))
                        .clipShape(Circle())
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    init(viewModel: PlayerViewModel)
    {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    // MARK: - Private properties

    @State private var sliderValue: Double = .zero
    @State private var index = 0
    private let carouselHeight: CGFloat = 274
    private let carouselWidth: CGFloat = 239
    private let carouselTopOffset: CGFloat = 30
}

struct SongTitleView: View
{
    let artistName: String
    let trackName: String
    var body: some View
    {
        VStack
        {
            Text(trackName)
                .font(.custom(.FontName.MontserratSemiBold, size: 16))
                .foregroundStyle(.whiteApp)
            Text(artistName)
                .font(.custom(.FontName.MontserratMedium, size: 13))
                .foregroundStyle(.semiWhiteApp)
        }
        .frame(minHeight: 80)
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
    }
}

#Preview
{
    NavigationStack
    {
        PlayerView(viewModel: PlayerViewModel(song: DummyData.songs[0]))
    }
}
