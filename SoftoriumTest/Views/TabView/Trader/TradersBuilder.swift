import SwiftUI

// MARK: - TradersBuilder

enum TradersBuilder {
    
    static func build() -> some View {
        let viewModel = TraderViewModel()
        let view = TradeView(viewModel: viewModel)
        return view
    }
}
