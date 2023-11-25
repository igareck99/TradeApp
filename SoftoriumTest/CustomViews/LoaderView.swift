import SwiftUI
import Foundation

// MARK: - LoaderView

struct LoaderView: View {
    
    @State private var showProgress = false
    @State private var currentValue = 0.0
    @StateObject var viewModel: LoaderViewModel
    
    var body: some View {
        ZStack(alignment: .center) {
            ProgressView(value: viewModel.currentValue, total: 100.0)
                .progressViewStyle(CustomLinearProgressViewStyle())
            Text("\(Int(viewModel.currentValue))%")
                .font(.inter16)
                .foregroundColor(.white)
        }
    }
}

// MARK: - CustomLinearProgressViewStyle


struct CustomLinearProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 30)
                .fill(.gray)
            RoundedRectangle(cornerRadius: 30)
                .fill(.green)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * (UIScreen.main.bounds.width - 37 * 2))
        }
        .frame(width: UIScreen.main.bounds.width - 37 * 2, height: 24)
        .padding(.horizontal, 37)
        
    }
}
