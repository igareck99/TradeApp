import Foundation
import SwiftUI
import Combine


final class TraderViewModel: ObservableObject {
    @Published var money = 1000
    @Published var moneyString = "1000"
    @Published var time = 1
    @Published var timeString = "00:01"
    @Published var showCurrencyPair = false
    @Published var currentCurrency: CurrencyCases = .AEDUSD
    @Published var isFocuedValue = false
    var urlString: URL? = nil
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        bindInput()
    }
    
    deinit {
        subscriptions.forEach { $0.cancel() }
        subscriptions.removeAll()
    }
    
    private func bindInput() {
        $currentCurrency
            .receive(on: DispatchQueue.main)
            .sink {[weak self] value in
                self?.urlString = value.url
                self?.objectWillChange.send()
            }.store(in: &subscriptions)
        
        $isFocuedValue
            .receive(on: DispatchQueue.main)
            .sink {[weak self] value in
                guard let self = self else { return }
                if !value {
                    if self.timeString.count != 5 {
                        self.timeString = "00:01"
                        self.time = 1
                        return
                    }
                    let index = self.timeString.firstIndex(of: ":")
                    if index == nil {
                        self.timeString = "00:01"
                        self.time = 1
                        return
                    }
                    let l = self.timeString.split(separator: ":")
                    if l.count != 2 {
                        self.timeString = "00:01"
                        self.time = 1
                        return
                    }
                    var result = ""
                    result += self.formatTimePart(String(l[0]))
                    result += ":"
                    result += self.formatTimePart(String(l[1]))
                }
            }.store(in: &subscriptions)
    }
    
    private func formatTimePart(_ value: String) -> String {
        if value.count != 2 {
            return "00"
        }
        do {
            let point = try Int(value, format: .number)
            if point > 59 {
                self.time = 59
                return "59"
            }
            self.time = point
            return value
        } catch {
            return "00"
        }
    }
}
