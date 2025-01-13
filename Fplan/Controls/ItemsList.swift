import SwiftUI
import Foundation


struct ItemsList: View {
    
    let title: String
    
    let items: [String]
    
    let cancel: (() -> Void)
    
    let select: ((_ item: String) -> Void)
    
    var body: some View {
        VStack{
            
            Header(title: title) {
                cancel()
            }
            
            List {
                ForEach(items, id: \.self) { item in
                    Button {
                        select(item)
                    } label: {
                        Text(item)
                    }
                }
            }
            
            .listStyle(.inset)
        }
    }
}
