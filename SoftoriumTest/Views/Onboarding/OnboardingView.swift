import SwiftUI
import UserNotifications

// MARK: - OnboardingView

struct OnboardingView: View {
    
    // MARK: - Internal Properties
    
    @StateObject var viewModel: OnboardingViewModel

    // MARK: - Body

    var body: some View {
        NavigationView {
            ZStack(alignment: .center, content: {
                Image("BG")
                    .scaledToFit()
                    .ignoresSafeArea(edges: .all)
                switch viewModel.state {
                case .loading:
                    EmptyView()
                case .start:
                    loader
                }
            })
            .overlay(
                NavigationLink(
                    destination: TabsBuilder.build(),
                    isActive: $viewModel.showTabView,
                    label: {
                        EmptyView()
                    })
            )
        }
    }
    
    // MARK: - Private Properties
    
    private var loader: some View {
        LoaderView(viewModel: LoaderViewModel(onEndLoading: {
            DispatchQueue.main.async {
                viewModel.registerForPushNotifications()
            }
        }))
    }
}
