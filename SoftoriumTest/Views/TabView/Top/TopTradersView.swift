import SwiftUI
import Foundation
struct TopTradersView: View {
    
    @StateObject var viewModel = TopTradersViewModel()
    
    init() {
        let navAppearance = UINavigationBarAppearance()
        UIScrollView.appearance().backgroundColor = .topTradersBackground
    }
    
    var body: some View {
        NavigationView {
            table
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("TOP 10 Traders")
                        .foregroundColor(.white)
                        .font(.inter22)
                }
            }
        }
    }
    
    private var table: some View {
        ScrollView(.vertical) {
            VStack(spacing: nil) {
                headerView
                    .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
                ForEach(Array(viewModel.displayItems.enumerated()), id: \.element) { index, value in
                    getRow(index + 1, value)
                        .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
                }
            }
        }
    }
    
    private var headerView: some View {
        HStack {
            HStack(spacing: 14, content: {
                Text("№")
                    .foregroundColor(.tableTextColor)
                Text("Сountry")
                    .foregroundColor(.tableTextColor)
                Text("Name")
                    .padding(.leading, 5)
                    .foregroundColor(.tableTextColor)
            }).padding(.leading, 12)
                .background(Color.topTradeViewlightBackground)
            Spacer()
            HStack(spacing: 19.5, content: {
                Text("Deposit")
                    .foregroundColor(.tableTextColor)
                Text("Profit")
                    .foregroundColor(.tableTextColor)
            })
            .background(Color.topTradeViewlightBackground)
            .padding(.trailing, 12)
        }
        .frame(idealHeight: 50)
        .background(Color.topTradeViewlightBackground)
        .clipShape(
            RoundedRectangle(cornerRadius: 8)
        )
    }
    
    @ViewBuilder
    private func getRow(_ number: Int, _ item: TraderData) -> some View {
        HStack {
            HStack(spacing: 14, content: {
                Text(String(number))
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .frame(width: 28)
                    .multilineTextAlignment(.leading)
                Image(item.country)
                    .resizable()
                    .frame(width: 26, height: 26)
                Text(item.name)
                    .padding(.leading, 14)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .frame(width: 68)
                    .multilineTextAlignment(.leading)
                    .fixedSize()
            })
            .padding(.leading, 12)
            Spacer()
            HStack(spacing: 19.5, content: {
                Text("$\(item.deposit)")
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .multilineTextAlignment(.trailing)
                    .frame(width: 61)
                Text("$\(item.profit)")
                    .foregroundColor(.loaderGreen)
                    .lineLimit(1)
                    .multilineTextAlignment(.trailing)
                    .frame(maxWidth: 74)
            }).padding(.leading, 12)
        }
            .frame(idealHeight: 50)
            .background(number % 2 == 0 ? .clear : Color.cellBacground)
    }
}
