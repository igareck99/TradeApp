import SwiftUI
import Combine

struct TradeView: View {
    
    @StateObject var viewModel: TraderViewModel
    @State private var keyboardHeight: CGFloat = 0
    @ObservedObject private var keyboard = KeyboardResponder()
    @FocusState var isFocused: Bool
    @FocusState var isFocusedMoney: Bool
    
    var body: some View {
        NavigationView {
            content
                .onTapGesture {
                    isFocused = false
                }
                .onTapGesture {
                    isFocusedMoney = false
                }
                .onChange(of: isFocused, perform: { value in
                    viewModel.isFocuedValue = value
                })
                .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(false)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("TOP 10 Traders")
                            .foregroundColor(.white)
                            .font(.inter22)
                    }
                }
            .overlay(
                NavigationLink(
                    destination: CurrencyBuilder.build(currentCurrency: $viewModel.currentCurrency),
                    isActive: $viewModel.showCurrencyPair,
                    label: {
                        EmptyView()
                    })
            )
        }
        .onAppear {
            UIScrollView.appearance().backgroundColor = .tradeViewBackground
        }
    }
    
    private var content: some View {
        ScrollView {
            balanceView
                .padding(.top, 15)
            WebView(url: viewModel.urlString)
                .frame(width: UIScreen.main.bounds.width, height: 375)
                .padding(.top, 25)
            VStack(alignment: .center, spacing: nil) {
                CurrencyView(width: UIScreen.main.bounds.width - 60, height: 54, backgroundColor: .cellBacground, title: viewModel.currentCurrency.rawValue)
                    .onTapGesture {
                        viewModel.showCurrencyPair = true
                    }
                    .padding(.top, 16)
                tradeView
                    .padding(.top, 10)
            }.padding(.bottom, keyboardHeight)
        }.frame(width: UIScreen.main.bounds.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color(.tradeViewBackground))
    }
    
    private var tradeView: some View {
        HStack(spacing: 11, content: {
            VStack(spacing: 20) {
                InvestmentView(title: "Timer",
                               type: .timer,
                               width: (UIScreen.main.bounds.width - 71) / 2,
                               time: $viewModel.time,
                               money: $viewModel.money,
                               currentValue: $viewModel.timeString,
                               isFocused: _isFocused)
                SellButton(backgroundColor: .red, title: "Sell")
            }
            VStack(spacing: 20) {
                InvestmentView(title: "Investment",
                               type: .money,
                               width: (UIScreen.main.bounds.width - 71) / 2,
                               time: $viewModel.time,
                               money: $viewModel.money,
                               currentValue: $viewModel.moneyString,
                               isFocused: _isFocusedMoney)
                SellButton(backgroundColor: .loaderGreen, title: "Buy")
            }
        })
    }
    
    private var balanceView: some View {
        ZStack(alignment: .center) {
            VStack(alignment: .center, spacing: 7) {
                Text("Balance")
                    .foregroundColor(.operationColor)
                Text("10 000")
                    .foregroundColor(.white)
            }
        }.frame(width: UIScreen.main.bounds.width - 60, height: 54)
            .background(Color.cellBacground)
            .cornerRadius(16)
    }
}


