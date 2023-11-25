import SwiftUI

enum CurrencyBuilder {
    
    static func build(currentCurrency: Binding<CurrencyCases>) -> some View {
        let viewModel = CurrencyPairViewModel()
        let view = CurrencyPairView(viewModel: viewModel,
                                    currentCurrency: currentCurrency)
        return view
    }
}
