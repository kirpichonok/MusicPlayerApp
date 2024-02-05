
import SwiftUI

struct SearchBarView: View
{
    // MARK: - Properties

    @Binding var searchText: String
    var action: ((String) -> Void)?

    var body: some View
    {
        HStack
        {
            if !isSearchFieldHidden
            {
                TextField(textFieldPlaceholder, text: $searchText)
                    .font(.custom(.FontName.MontserratMedium, size: searchFieldFontSize))
                    .padding(10)
                    .background(.whiteApp.opacity(backgroundOpacity))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .transition(AnyTransition.offset(x: 600, y: .zero)
                        .combined(with: .scale(scale: .zero, anchor: .trailing))
                        .combined(with: .opacity))
            }

            Spacer(minLength: viewSpacing)

            Button(
                action:
                {
                    if !searchText.isEmpty
                    {
                        action?(searchText)
                    }
                    else
                    {
                        withAnimation
                        {
                            isSearchFieldHidden.toggle()
                        }
                    }

                },
                label:
                {
                    Image(systemName: .SystemImageName.magnifyingGlass)
                        .padding(10)
                        .background(.whiteApp.opacity(backgroundOpacity))
                        .clipShape(Circle())
                }
            )
        }
        .frame(height: 40)
    }

    // MARK: - Private properties

    @State private var isSearchFieldHidden = true

    private let textFieldPlaceholder = "Search"
    private let searchFieldFontSize: CGFloat = 16
    private let backgroundOpacity: CGFloat = 0.3
    private let viewSpacing: CGFloat = 15
}

#Preview
{
    SearchBarView(searchText: .constant(""))
        .background(.blue)
}
