import SwiftUI
import ExpoFpFplan

struct MenuView: View {
    
    let fplanView: FplanView
    
    @Binding var showFplanView: Bool
    
    @State var categories: [String] = []
    @State var exhibitors: [String] = []
    @State var booths: [String] = []
    
    var body: some View {
        
        ZStack {
            if(!showFplanView && !categories.isEmpty){
                ItemsList(title: "Categories", items: categories, cancel: { categories = [] }) { item in
                    fplanView.selectCategory(item)
                    showFplanView = true
                }
            }
            else if(!showFplanView && !exhibitors.isEmpty){
                ItemsList(title: "Exhibitors", items: exhibitors, cancel: { exhibitors = [] }) { item in
                    fplanView.selectExhibitor(item)
                    showFplanView = true
                }
            }
            else if(!showFplanView && !booths.isEmpty){
                ItemsList(title: "Booths", items: booths, cancel: { booths = [] }) { item in
                    fplanView.selectBooth(item)
                    showFplanView = true
                }
            }
            else{
                VStack {
                    Button(action: {
                        fplanView.categoriesList(){ cats in
                            categories = cats.map(){ category in
                                category.name
                            }
                        }
                    }, label: {
                        CircledText(text: "Categories")
                    })
                    
                    Button(action: {
                        fplanView.exhibitorsList{ exhrs in
                            exhibitors = exhrs.map(){ exhibitor in
                                exhibitor.name
                            }
                        }
                    }, label: {
                        CircledText(text: "Exhibitors")
                    })
                    
                    Button(action: {
                        fplanView.boothsList{ bths in
                            booths = bths.map(){ booth in
                                booth.name
                            }
                        }
                    }, label: {
                        CircledText(text: "Booths")
                    })
                    
                    Button(action: {
                        showFplanView = true
                    }, label: {
                        CircledText(text: "Floorplan")
                        
                    })
                }
                .padding()
            }
        }
    }
}
