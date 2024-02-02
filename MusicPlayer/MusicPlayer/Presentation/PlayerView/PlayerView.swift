import SwiftUI

struct PlayerView: View
{
    // MARK: - Properties

    @EnvironmentObject var coordinator: Coordinator
    var body: some View
    {
        ZStack
        {
            LinearGradient.background.ignoresSafeArea()

            VStack
            {
                ImageCarouselView(imageWidth: carouselWidth,
                                  imageHeight: carouselHeight,
                                  views: DummyData.imageURLs)
                    .padding(.top, carouselTopOffset)

                SongTitleView()

                Group
                {
                    Spacer()

                    PlayerTrackView(sliderValue: $sliderValue)

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
                    coordinator.pop()
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

    // MARK: - Private properties

    @State private var sliderValue: Double = .zero
    @State private var index = 0
    private let carouselHeight: CGFloat = 274
    private let carouselWidth: CGFloat = 239
    private let carouselTopOffset: CGFloat = 50
}

struct PlayerTrackView: View
{
    @Binding var sliderValue: Double

    var body: some View
    {
        VStack(spacing: 11)
        {
            Slider(value: $sliderValue, in: 0...10)
                .tint(.white)
            HStack
            {
                Text("0:00")
                Spacer()
                Text("0:00")
            }
            .foregroundStyle(.whiteApp.opacity(0.4))
        }
    }
}

struct SongTitleView: View
{
    var body: some View
    {
        VStack
        {
            Text("Eminem")
                .font(.custom(.FontName.MontserratSemiBold, size: 16))
                .foregroundStyle(.whiteApp)
            Text("Relaxing music")
                .font(.custom(.FontName.MontserratMedium, size: 13))
                .foregroundStyle(.semiWhiteApp)
        }
        .padding(.top, 30)
    }
}

#Preview
{
    PlayerView()
}
