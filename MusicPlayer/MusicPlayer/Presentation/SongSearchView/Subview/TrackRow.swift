import SwiftUI

struct TrackRow: View
{
    var imageURL: URL?
    var title: String
    var author: String
    var action: (() -> Void)?

    var body: some View
    {
        HStack
        {
            AsyncImage(url: imageURL)
            { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            placeholder:
            {
                Image(systemName: .SystemImageName.photo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            
            VStack(alignment: .leading)
            {
                Text(title)
                    .font(.custom(.FontName.MontserratSemiBold, size: titleFontSize))
                    .font(.title2)
                Text(author)
                    .font(.custom(.FontName.MontserratMedium, size: authorFontSize))
                    .foregroundStyle(.secondary)
            }

            Spacer()
            Button
            {
                action?()
            } label:
            {
                Image(systemName: .SystemImageName.playFill)
            }
        }
    }

    // MARK: - Private

    private let titleFontSize: CGFloat = 16
    private let authorFontSize: CGFloat = 13
}

#Preview
{
    TrackRow(
        imageURL: nil,
        title: "Eminem",
        author: "Eminem"
    )
}
