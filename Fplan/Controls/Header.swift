import SwiftUI
import Foundation

struct Header: View {

    let title: String
    let backButtonAction: () -> Void
    
    var body: some View {
        return HStack {
            Button {
                backButtonAction()
            } label: {
                Image("back")
                    .resizable()
                    .clipped()
                    .frame(width: 12, height: 18, alignment: .leading)
            }
            .padding(.leading, 20)
            
            Spacer()
            
            Text(title)
                .font(.system(size: 20))
                .fontWeight(.medium)
                .frame(alignment: .leading)
            
            Spacer()
        }
    }
}
