import SwiftUI

// MARK: - TabsView

struct TabsView: View {
    
    @StateObject var viewModel = TabsViewModel()
    
    init() {
        let appearance = UITabBarAppearance()
        let navAppearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 31 / 255.0, green: 34 / 255.0, blue: 47 / 255.0, alpha: 1)
        navAppearance.backgroundColor = UIColor.tradeViewBackground
        UINavigationBar.appearance().standardAppearance = navAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        TabView(selection: $viewModel.selectedItem) {
            TradersBuilder.build()
                .tabItem {
                    VStack(spacing: 2) {
                        Text(Tabs.trade.text)
                        Tabs.trade == viewModel.selectedItem ?
                        Tabs.trade.selectedImage : Tabs.trade.image
                    }
                }
                .tag(Tabs.trade)
            TopTradersView()
                .tabItem {
                    VStack(spacing: 2) {
                        Text(Tabs.topTraders.text)
                            .foregroundColor(.loaderGreen)
                        Tabs.topTraders == viewModel.selectedItem ?
                        Tabs.topTraders.selectedImage : Tabs.topTraders.image
                    }
                }
                .tag(Tabs.topTraders)
        }
        .navigationBarBackButtonHidden(true)
    }
}
