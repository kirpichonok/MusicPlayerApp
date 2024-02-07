import SwiftUI

struct PlayerButtonsView: View
{
    var body: some View
    {
        HStack
        {
            Image(.backwardEndFill)
                .resizable()
                .frame(width: buttonFrameWidth,
                       height: buttonFrameHeight)
                .foregroundStyle(.whiteApp)
            Spacer()
            ZStack
            {
                Circle()
                    .foregroundStyle(.whiteApp)
                    .frame(width: circleFrameWidth)

                Image(.playFill)
                    .resizable()
                    .frame(width: buttonFrameWidth,
                           height: buttonFrameHeight)
            }
            Spacer()
            Image(.forwardEndFill)
                .resizable()
                .frame(width: buttonFrameWidth,
                       height: buttonFrameHeight)
                .foregroundStyle(.whiteApp)
        }
        .frame(minHeight: 78)
    }
    
    // MARK: - Private Properties

    private let buttonFrameWidth: CGFloat = 32
    private let buttonFrameHeight: CGFloat = 32
    private let circleFrameWidth: CGFloat = 78
}

#Preview {
    PlayerButtonsView()
        .background(.black)
}
