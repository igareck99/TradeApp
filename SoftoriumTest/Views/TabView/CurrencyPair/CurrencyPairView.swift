import SwiftUI

struct CurrencyPairView: View {

    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: CurrencyPairViewModel
    @Binding var currentCurrency: CurrencyCases
    private var gridItemLayout: [GridItem]
    
    init(viewModel: CurrencyPairViewModel,
         currentCurrency: Binding<CurrencyCases>,
         gridItemLayout: [GridItem] = [GridItem(.fixed(161)), GridItem(.fixed(161))]) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self._currentCurrency = currentCurrency
        self.gridItemLayout = gridItemLayout
    }

    var body: some View {
        currenciesView
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(false)
            .navigationBarBackButtonHidden(true)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.white)
                    })
                }
                ToolbarItem(placement: .principal) {
                    Text("Currency pair")
                        .font(.inter22)
                        .foregroundColor(.white)
                }
            })
            .onAppear {
                UIScrollView.appearance().backgroundColor = .viewBackground
            }
    }
    
    private var currenciesView: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: gridItemLayout, spacing: 20) {
                    ForEach(viewModel.currencies, id: \.self) { value in
                        getCurrencyView(value)
                    }
                }
                .padding(.top, 36)
            }
        }
    }
    
    @ViewBuilder
    private func getCurrencyView(_ item: CurrencyCases) -> some View {
        ZStack(alignment: .center) {
            Rectangle()
                .fill(currentCurrency == item ? Color.loaderGreen : Color.cellCurrencyBackground)
                .frame(width: (UIScreen.main.bounds.width - 95) / 2,
                       height: 54)
                .cornerRadius(16)
            Text(item.rawValue)
                .foregroundColor(.white)
                .font(.inter14)
            
        }.onTapGesture {
            currentCurrency = item
        }
    }
}
