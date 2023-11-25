import SwiftUI


struct LargeButtonStyle: ButtonStyle {
    
    let backgroundColor: Color
    let foregroundColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .padding()
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(foregroundColor, lineWidth: 1)
        )
            .padding([.top, .bottom], 10)
            .font(.system(size: 24, weight: .regular))
    }
}

struct LargeButton: View {
    
    private static let width: CGFloat = 152
    private static let height: CGFloat = 54
    
    var backgroundColor: Color
    var foregroundColor: Color
    
    private let title: String
    private let action: () -> Void
    
    init(title: String,
         backgroundColor: Color = Color.green,
         foregroundColor: Color = Color.white,
         action: @escaping () -> Void) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.title = title
        self.action = action
    }
    
    var body: some View {
        HStack {
            Button(action: self.action) {
                Text(self.title)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(LargeButtonStyle(backgroundColor: backgroundColor,
                                          foregroundColor: foregroundColor))
        }
        .frame(idealWidth: LargeButton.width, idealHeight: LargeButton.height)
    }
}


struct SellButton: View {
    private static let width: CGFloat = 152
    private static let height: CGFloat = 54
    
    let backgroundColor: Color
    let foregroundColor: Color
    var title: String
    
    init(backgroundColor: Color,
         title: String,
         foregroundColor: Color = .white) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.title = title
    }
    
    var body: some View {
        ZStack {
            Text(title)
                .padding(.top, 8)
                .padding(.leading, 20)
                .font(.system(size: 24))
                .foregroundColor(.white)
        }.frame(width: 152, height: 54, alignment: .topLeading)
            .background(backgroundColor)
            .cornerRadius(16)
    }
}



#Preview {
    SellButton(backgroundColor: .red, title: "Buy")
}
