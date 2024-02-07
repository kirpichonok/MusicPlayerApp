import SwiftUI

struct PlayerTrackView: View
{
    @Binding var sliderValue: Double
    var songStartTime: String
    var songFinishTime: String

    var body: some View
    {
        VStack(spacing: 11)
        {
            Slider(value: $sliderValue, in: 0...10)
                .tint(.white)
            HStack
            {
                Text(songStartTime)
                Spacer()
                Text(songFinishTime)
            }
            .foregroundStyle(.whiteApp.opacity(0.4))
        }
        .onAppear
        {
            setSliderAppearance()
        }
    }

    private let thumbSize = CGSize(width: 16, height: 16)
    private func setSliderAppearance()
    {
        let thumbImage = UIImage(systemName: .SystemImageName.circleFill)?
            .scaleTo(size: thumbSize)
            .withTintColor(.whiteApp)
        UISlider.appearance().setThumbImage(thumbImage, for: .normal)
    }
}

#Preview {
    PlayerTrackView(sliderValue: .constant(2),
                    songStartTime: "0:00",
                    songFinishTime: "2:10")
    .background(.gray)
}
