import SwiftUI

@main
struct LittleLemonApp: App {
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                HomeView()
            } else {
                OnboardingView()
            }
        }
    }
}
