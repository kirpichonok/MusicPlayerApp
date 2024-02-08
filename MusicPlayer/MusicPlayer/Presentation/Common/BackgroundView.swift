import SwiftUI

struct BackgroundView: View
{
    var body: some View
    {
        ZStack
        {
            Color.backgroundCommon
                .ignoresSafeArea()
            Circle()
                .fill(Color.backgroundDark)
                .frame(width: circleFrameWidth,
                       height: circleFrameHeight)
                .position(darkCircleFramePosition)
                .blur(radius: blurRadius)
            Circle()
                .fill(Color.backgroundLight)
                .frame(width: circleFrameWidth,
                       height: circleFrameHeight)
                .position(lightCircleFramePosition)
                .blur(radius: blurRadius)
        }
    }

    // MARK: - Private properties

    private let blurRadius: CGFloat = 100
    private let circleFrameWidth: CGFloat = 350
    private let circleFrameHeight: CGFloat = 350
    private let lightCircleFramePosition = CGPoint(x: 35,
                                                   y: 614)
    private let darkCircleFramePosition = CGPoint(x: 285,
                                                   y: 163)
}

#Preview
{
    BackgroundView()
}
