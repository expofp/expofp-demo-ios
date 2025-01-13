import SwiftUI
import Foundation

struct CircledText: View {

    let text: String
    var body: some View {
        return  Text(text)
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(40)
    }
}
