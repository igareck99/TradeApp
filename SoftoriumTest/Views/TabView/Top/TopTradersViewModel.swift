import Foundation


final class TopTradersViewModel: ObservableObject {
    
    @Published var traders: [TraderData]
    @Published var displayItems: [TraderData] = []
    
    init(traders: [TraderData] = TraderData.tradersMockList()) {
        self.traders = traders
        displayItems = Array(traders[0 ..< 10])
        let timer = Timer.scheduledTimer(timeInterval: 5,
                                         target: self,
                                         selector: #selector(handleTimerExecution),
                                         userInfo: nil,
                                         repeats: true)
    }
    
    @objc private func handleTimerExecution() {
        traders = traders.map {
            let profit = Int.random(in: -150..<50)
            let data = TraderData(country: $0.country, name: $0.name,
                                  deposit: $0.deposit + profit, profit: profit)
            return data
        }.sorted(by: { $0.profit > $1.profit })
        displayItems = Array(traders[0 ..< 10])
    }
}
