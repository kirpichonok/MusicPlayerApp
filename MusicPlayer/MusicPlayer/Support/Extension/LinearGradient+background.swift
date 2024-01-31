import SwiftUI

extension LinearGradient
{
    static let background = LinearGradient(
        colors: [.backgroundDark, .backgroundLight],
        startPoint: .topTrailing,
        endPoint: .bottomLeading
    )
}
