import SwiftUI

struct ImageCarouselView: View
{
    // MARK: - Properties

    var imageWidth: CGFloat
    var imageHeight: CGFloat
    var spacing: CGFloat = 24
    var imagesURLs: [URL]
    var body: some View
    {
        ZStack
        {
            ForEach(0..<imagesURLs.count)
            { i in
                AsyncImage(url: imagesURLs[i])
                { imagePhase in
                    if case let .success(image) = imagePhase
                    {
                        image
                            .resizable()
                            .frame(width: imageWidth, height: getHeight(i))
                            .animation(.interpolatingSpring(stiffness: imageWidth,
                                                            damping: 30,
                                                            initialVelocity: 10),
                                       value: carousalLocation)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .opacity(getOpacity(i))
                            .offset(x: getOffset(i))
                    }
                }
            }
        }
        .gesture(
            DragGesture()
                .updating($dragState)
                { drag, state, _ in
                    state = .dragging(translation: drag.translation)
                }
                .onEnded(onDragEnded)
        )
    }

    // MARK: - Private properties

    @GestureState private var dragState = DragState.inactive
    @State private var carousalLocation = 0
    private let dragThreshold: CGFloat = 200

    // MARK: - Private methods

    private func relativeLoc() -> Int
    {
        return ((imagesURLs.count * 10000) + carousalLocation) % imagesURLs.count
    }

    private func getOffset(_ i: Int) -> CGFloat
    {
        if i == relativeLoc()
        {
            return dragState.translation.width
        }
        else if i == relativeLoc() + 1
            || relativeLoc() == imagesURLs.count - 1 && i == 0
        {
            return dragState.translation.width + (imageWidth + spacing)
        }
        else if i == relativeLoc() - 1
            || relativeLoc() == 0 && i == imagesURLs.count - 1
        {
            return dragState.translation.width - (imageWidth + spacing)
        }
        else if i == relativeLoc() + 2
            || (relativeLoc() == imagesURLs.count - 1 && i == 1)
            || (relativeLoc() == imagesURLs.count - 2 && i == 0)
        {
            return dragState.translation.width + (2 * (imageWidth + spacing))
        }
        else if i == relativeLoc() - 2
            || (relativeLoc() == 1 && i == imagesURLs.count - 1)
            || (relativeLoc() == 0 && i == imagesURLs.count - 2)
        {
            return dragState.translation.width - (2 * (imageWidth + spacing))
        }
        else if i == relativeLoc() + 3
            || (relativeLoc() == imagesURLs.count - 1 && i == 2)
            || (relativeLoc() == imagesURLs.count - 2 && i == 1)
            || (relativeLoc() == imagesURLs.count - 3 && i == 0)
        {
            return dragState.translation.width + (3 * (imageWidth + spacing))
        }
        else if i == relativeLoc() - 3
            || (relativeLoc() == 2 && i == imagesURLs.count - 1)
            || (relativeLoc() == 1 && i == imagesURLs.count - 2)
            || (relativeLoc() == 0 && i == imagesURLs.count - 3)
        {
            return dragState.translation.width - (3 * (imageWidth + spacing))
        }
        else
        {
            return 10000
        }
    }

    private func getHeight(_ i: Int) -> CGFloat
    {
        if i == relativeLoc()
        {
            return imageHeight
        }
        return imageHeight - 100
    }

    private func getOpacity(_ i: Int) -> Double
    {
        if i == relativeLoc()
            || i + 1 == relativeLoc()
            || i - 1 == relativeLoc()
            || i + 2 == relativeLoc()
            || i - 2 == relativeLoc()
            || (i + 1) - imagesURLs.count == relativeLoc()
            || (i - 1) - imagesURLs.count == relativeLoc()
            || (i + 2) - imagesURLs.count == relativeLoc()
            || (i - 2) - imagesURLs.count == relativeLoc()
        {
            return 1
        }
        return 0
    }

    private func onDragEnded(drag: DragGesture.Value)
    {
        if drag.predictedEndTranslation.width > dragThreshold || drag.translation.width > dragThreshold
        {
            carousalLocation -= 1
        }
        else if (drag.predictedEndTranslation.width) < (-1 * dragThreshold) || (drag.translation.width) < (-1 * dragThreshold)
        {
            carousalLocation += 1
        }
    }
}

#Preview
{
    ImageCarouselView(imageWidth: 240, imageHeight: 270, imagesURLs: DummyData.imageURLs)
}
