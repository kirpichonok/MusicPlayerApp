import SwiftUI

@main
struct MusicPlayerApp: App {
    var body: some Scene {
        WindowGroup {
            CoordinatorRootView()
                .environmentObject(Coordinator())
        }
    }
}
