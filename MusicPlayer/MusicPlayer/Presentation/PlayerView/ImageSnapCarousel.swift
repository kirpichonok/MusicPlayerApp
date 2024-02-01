import SwiftUI

struct ImageSnapCarousel<Content: View, T: Identifiable>: View
{
    // MARK: - Properties

    @Binding var index: Int
    var body: some View
    {
        GeometryReader
        { proxy in
            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustWidth = (trailingSpace / 2) - spacing

            HStack(spacing: spacing)
            {
                ForEach(list)
                { item in
                    content(item)
                        .frame(width: proxy.size.width - trailingSpace)
                }
            }
            .padding(.horizontal, spacing)
            .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex == 0 ? 0 : adjustWidth) + offset)
            .gesture(
                DragGesture()
                    .updating($offset,
                              body: { value, out, _ in
                                  out = value.translation.width
                              })
                    .onChanged
                    { value in
                        let gestureOffsetX = -value.translation.width
                        let roundedProgress = (gestureOffsetX / width).rounded()
                        index = max(
                            min(currentIndex + Int(roundedProgress), list.count - 1),
                            0
                        )
                    }
                    .onEnded
                    { _ in currentIndex = index }
            )
        }
        .animation(.easeInOut, value: offset == 0)
    }

    init(spacing: CGFloat = 15,
         trailingSpace: CGFloat = 100,
         index: Binding<Int>,
         items: [T],
         @ViewBuilder content: @escaping (T) -> Content)
    {
        list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        _index = index
        self.content = content
    }

    // MARK: - Private properties

    @GestureState private var offset: CGFloat = 0
    @State private var currentIndex = 0
    private var content: (T) -> Content
    private var list: [T]
    private var spacing: CGFloat
    private var trailingSpace: CGFloat
}

#Preview
{
    ImageHorizontalScrollView(urls: .constant(DummyData.imageURLs))
}
