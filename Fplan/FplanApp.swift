import SwiftUI
import ExpoFpFplan

@main
struct FplanApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .ignoresSafeArea(.keyboard)
        }
    }
}
