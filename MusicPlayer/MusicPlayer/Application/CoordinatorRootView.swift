import SwiftUI

struct CoordinatorRootView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.songSearch)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page)
                }
        }
        .environmentObject(coordinator)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CoordinatorRootView().environmentObject(Coordinator())
}
