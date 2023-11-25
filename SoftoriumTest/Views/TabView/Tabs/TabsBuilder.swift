import SwiftUI

// MARK: - TabsBuilder

enum TabsBuilder {

    static func build() -> some View {
        let viewModel = TabsViewModel()
        let view = TabsView()
        return view
    }
}
