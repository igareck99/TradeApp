import SwiftUI

// MARK: - InvestmentView

struct InvestmentView: View {
    
    var title: String
    var type: InvestmentCases
    var width: CGFloat
    @Binding var time: Int
    @Binding var money: Int
    @Binding var currentValue: String
    @FocusState var isFocused: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.cellBacground)
                .frame(width: width, height: 54)
                .cornerRadius(16)
            content
        }
        .overlay {
            if isFocused {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.loaderGreen)
                    .frame(width: width, height: 54)
            }
        }
    }
    
    var content: some View {
        VStack(alignment: .center, spacing: 7) {
            Text(self.title)
                .font(.inter12)
                .foregroundColor(.white)
            HStack(spacing: 19) {
                Image(systemName: "minus.circle")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(.operationColor)
                    .onTapGesture {
                        switch type {
                        case .timer:
                            onTapMinusTimer()
                        case .money:
                            onTapMinusMoney()
                        }
                    }
                InvestmentTextView(input: $currentValue, isFocused: _isFocused)
                    .font(.inter16)
                    .foregroundColor(.white)
                Image(systemName: "plus.circle")
                    .resizable()
                    .foregroundColor(.operationColor)
                    .frame(width: 18, height: 18)
                    .onTapGesture {
                        switch type {
                        case .timer:
                            onTapPlusTimer()
                        case .money:
                            onTapPlusMoney()
                        }
                    }
            }
        }
    }
    
    func onTapPlusTimer() {
        if !isFocused {
            DispatchQueue.main.async {
                self.time += 1
                self.currentValue = timeStringFor(time)
            }
        }
    }
    
    func onTapMinusTimer() {
        if !isFocused {
            if time > 1 {
                DispatchQueue.main.async {
                    self.time -= 1
                    self.currentValue = timeStringFor(time)
                }
            }
        }
    }
    
    func onTapMinusMoney() {
        if !isFocused {
            if money > 1 {
                money = money - 1
                currentValue = money.currency
            }
        }
    }
    
    func onTapPlusMoney() {
        if !isFocused {
            if money < 10000 {
                money = money + 1
                currentValue = money.currency
            }
        }
    }
}

enum InvestmentCases {
    case timer
    case money
}
