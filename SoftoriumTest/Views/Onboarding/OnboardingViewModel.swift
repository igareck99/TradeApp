import Foundation
import UserNotifications


// MARK: - OnboardingViewModel

final class OnboardingViewModel: ObservableObject {
    
    @Published var state: OnboardingViewState
    @Published var showTabView = false
    
    init(state: OnboardingViewState = .loading) {
        self.state = state
        self.startData()
    }
    
    func registerForPushNotifications() {
      UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { [weak self]
        (granted, error) in
        debugPrint("Permission granted: \(granted)")
          self?.showTabView = true
      }
    }
    
    private func startData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.state = .start
        })
    }
}
