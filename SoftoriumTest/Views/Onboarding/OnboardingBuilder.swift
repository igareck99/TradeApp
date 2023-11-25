import SwiftUI

// MARK: - OnboardingBuilder

enum OnboardingBuilder {

    static func build() -> some View {
        let viewModel = OnboardingViewModel()
        let view = OnboardingView(viewModel: viewModel)
        return view
    }
}
