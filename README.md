## Recommendations for use

```swift
import SwiftUI
import ExpoFpFplan

struct ContentView: View {
    
    @State var showFplanView: Bool = false
    @State var showProgressView: Bool = false
    
    let fplanView = FplanView()
    
    var body: some View {
        ZStack {
            MenuView(fplanView: fplanView, showFplanView: $showFplanView)

            VStack {
                
                Header(title: "Floorplan") {
                    showFplanView = false
                }
                
                fplanView
                    .onFpReady {
                        showProgressView = false
                    }
                    .onAppear {
                        showProgressView = true
                        fplanView.load("https://demo.expofp.com")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .ignoresSafeArea(.keyboard)
            }
            .hidden(!showFplanView)
            
            ProgressView()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .background(Color.gray.opacity(0.4))
                .hidden(!showProgressView)
        }
    }
}
```
