import SwiftUI

struct CurrencyView: View {
    private let width: CGFloat
    private let height: CGFloat
    
    let backgroundColor: Color
    let foregroundColor: Color
    var title: String = "Sell"
    
    init(width: CGFloat,
         height: CGFloat,
         backgroundColor: Color,
         title: String,
         foregroundColor: Color = .white) {
        self.width = width
        self.height = height
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.title = title
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack {
                HStack {
                    Spacer()
                    Text(title)
                        .font(.inter16)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            Image("arrow-left")
                .padding(.trailing, 15)
        }.frame(width: width, height: height)
            .background(backgroundColor)
            .cornerRadius(16)
    }
}

#Preview {
    CurrencyView(width: UIScreen.main.bounds.width - 60, height: 54, backgroundColor: .cellCurrencyBackground,
                 title: "GPB/USD", foregroundColor: .white)
}
