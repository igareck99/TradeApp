import Foundation


final class TabsViewModel: ObservableObject {
    
    @Published var selectedItem = Tabs.trade
    @Published var tabs = Tabs.allCases
}
