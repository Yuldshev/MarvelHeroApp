import SwiftUI

struct AppInfo: View {
  let header: String
  let text: String
  
  @Environment(\.colorScheme) var colorScheme
  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text(header)
        .gilroyHeavy(size: .small)
      
      Text(text)
        .gilroyRegular()
    }
    .foregroundStyle(colorScheme == .light ? .white : .black)
    .padding(24)
    .padding(.top, 24)
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .background(colorScheme == .light ? .black : .white)
  }
}
