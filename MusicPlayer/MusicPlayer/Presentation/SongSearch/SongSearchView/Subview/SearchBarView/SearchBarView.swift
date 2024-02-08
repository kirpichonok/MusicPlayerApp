import SwiftUI

struct SearchBarView: View
{
    @Binding var searchText: String
    @State var isSearchFieldHidden = true
    @FocusState var focusValue: Bool
    var onSearchTapAction: ((String) -> Void)?
    var body: some View
    {
        if #available(iOS 17, *)
        {
            SearchBar(
                searchText: $searchText,
                isSearchFieldHidden: $isSearchFieldHidden,
                focusValue: $focusValue,
                onSearchTapAction: onSearchTapAction
            )
            .onChange(of: focusValue)
            { _, newValue in
                isSearchFieldHidden = !newValue
            }
        }
        else
        { SearchBar(
            searchText: $searchText,
            isSearchFieldHidden: $isSearchFieldHidden,
            focusValue: $focusValue,
            onSearchTapAction: onSearchTapAction
        )
        .onChange(of: focusValue)
        { newValue in
            isSearchFieldHidden = !newValue
        }
        }
    }
}

#Preview
{
    SearchBarView(searchText: .constant(""))
        .background(.blue)
}
