import SwiftUI
import Kingfisher
import SwiftfulLoadingIndicators

struct KingfisherLoader: View {
  var url: String = Constants.randomImage
  var resizingMode: SwiftUI.ContentMode = .fit
  var cornerRadius: CGFloat = 12
  var placeholder: Color = .gray.opacity(0.2)
  
  var body: some View {
    KFImage(URL(string: url))
      .placeholder {
        ZStack {
          placeholder
          LoadingIndicator()
        }
      }
      .cacheMemoryOnly()
      .fade(duration: 0.25)
      .resizable()
      .aspectRatio(contentMode: resizingMode)
      .cornerRadius(cornerRadius)
  }
}

#Preview {
  KingfisherLoader()
    .padding(50)
    
}
