import SwiftUI

// MARK: - InvestmentTextView

struct InvestmentTextView: View {
    @Binding var input: String
    @FocusState var isFocused: Bool
    
    
    var body: some View {
        VStack {
            TextField(text: $input, label: { EmptyView() })
                .frame(idealWidth: 46, maxWidth: 46, idealHeight: 19)
                //.background(Color.cellCurrencyBackground)
                .foregroundColor(.white)
                .keyboardType(.numberPad)
                .focused($isFocused)
        }
    }
}

