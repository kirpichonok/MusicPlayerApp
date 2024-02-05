import Foundation

enum DragState
{
    case inactive
    case dragging(translation: CGSize)

    var translation: CGSize
    {
        switch self
        {
        case .inactive:
            return .zero
        case let .dragging(translation):
            return translation
        }
    }

    var isDragging: Bool
    {
        switch self
        {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}
