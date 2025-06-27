import SwiftUI
import SwiftfulUI

struct InlineNavigation: ViewModifier {
  @Environment(\.router) var router
  let title: String
  
  func body(content: Content) -> some View {
    content
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden()
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text(title.capitalized)
            .gilroySemibold()
        }
        
        ToolbarItem(placement: .topBarLeading) {
          Image(systemName: "chevron.left")
            .padding(8)
            .offset(x: -8)
            .asButton(.press) {
              router.dismissScreen()
            }
        }
      }
  }
}

extension View {
  func inlineNav(title: String) -> some View {
    modifier(InlineNavigation(title: title))
  }
}
