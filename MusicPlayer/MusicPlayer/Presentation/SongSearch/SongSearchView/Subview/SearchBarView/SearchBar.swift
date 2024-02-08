import SwiftUI

struct SearchBar: View
{
    // MARK: - Properties

    @Binding var searchText: String
    @Binding var isSearchFieldHidden: Bool
    var focusValue: FocusState<Bool>.Binding
    var onSearchTapAction: ((String) -> Void)?
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
                    .submitLabel(.search)
                    .transition(AnyTransition.offset(x: 600, y: .zero)
                        .combined(with: .scale(scale: .zero, anchor: .trailing))
                        .combined(with: .opacity))
                    .focused(focusValue)
                    .onSubmit
                    {
                        onSearchTapAction?(searchText)
                        focusValue.wrappedValue = true
                    }
            }

            Spacer(minLength: viewSpacing)

            Button(
                action:
                {
                    guard !isSearchFieldHidden
                    else
                    {
                        isSearchFieldHidden.toggle()
                        focusValue.wrappedValue = true
                        return
                    }

                    if !searchText.isEmpty
                    {
                        onSearchTapAction?(searchText)
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

    private let textFieldPlaceholder = "Search"
    private let searchFieldFontSize: CGFloat = 16
    private let backgroundOpacity: CGFloat = 0.3
    private let viewSpacing: CGFloat = 15
}

#Preview
{
    @FocusState var value: Bool

    return SearchBar(
        searchText: .constant(""),
        isSearchFieldHidden: .constant(false),
        focusValue: $value
    )
}
