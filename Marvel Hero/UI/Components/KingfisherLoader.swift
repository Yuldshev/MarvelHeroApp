import SwiftUI
import Kingfisher

struct KingfisherLoader: View {
  var url: String = ""
  var resizingMode: SwiftUI.ContentMode = .fill
  var placeholder: Color = .gray.opacity(0.2)
  
  var body: some View {
    Rectangle()
      .opacity(0.01)
      .overlay {
        KFImage(URL(string: url))
          .placeholder {
            ZStack {
              placeholder
                .skeleton(true)
            }
          }
          .resizable()
          .aspectRatio(contentMode: resizingMode)
          
      }
      .clipped()
  }
}

#Preview {
  HStack {
    KingfisherLoader()
      .frame(width: 180, height: 230)
    
    KingfisherLoader()
      .frame(width: 140, height: 230)
  }
    
}
