import Foundation

final class LoaderViewModel: ObservableObject {
    
    @Published var currentValue = 0.0
    var onEndLoading: () -> Void
    
    init(onEndLoading: @escaping () -> Void) {
        self.onEndLoading = onEndLoading
        self.fire()
    }
    
    
    func fire() {
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 0.1,
                                                             execute: { [weak self] in
            for _ in 0..<100 {
                DispatchQueue.main.async {
                    self?.currentValue += 1
                }
                usleep(100000)
            }
            self?.onEndLoading()
        })
    }
}
