import SwiftUI

// MARK: - Tabs

enum Tabs: CaseIterable {
    case trade
    case topTraders
    
    var text: String {
        switch self {
        case .trade:
            return "Trade"
        case .topTraders:
            return "Top"
        }
    }
    
    var selectedImage: Image {
        switch self {
        case .trade:
            return Image("activity-active")
        case .topTraders:
            return Image("top-active")
        }
    }
    
    var image: Image {
        switch self {
        case .trade:
            return Image("activity-not-active")
        case .topTraders:
            return Image("top-not")
        }
    }
}
