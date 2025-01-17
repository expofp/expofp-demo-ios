## Recommendations for use

The Fplan should be opened once when the application is launched, then the Fplan should be hidden until it is needed. 
Interaction with the Fplan should only occur using functions (selectBooth(), selectExhibitor(), etc.) and events (onFpReady, onBoothClick, etc.).

Example:

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

            //When the application starts, showFplanView=false, so the VStack will be hidden until the moment when the plan needs to be displayed.
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
                        
                        //Opening an offline plan
                        fplanUiView.downloadZipToCache("https://demo.expofp.com") { htmlFilePath, error in 
                            fplanUiView.openFile(htmlFilePathUrl: filePath, params: "?noOverlay=true", settings: Settings()) 
                        }

                        //Opening a plan via a URL
                        //fplanView.load("https://demo.expofp.com")
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
