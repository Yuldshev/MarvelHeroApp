import SwiftUI

extension View {
  func onFullyRendered(_ completion: @escaping () -> Void) -> some View {
    self
      .background(
        GeometryReader { _ in
          Color.clear
            .onAppear {
              DispatchQueue.main.async {
                completion()
              }
            }
        }
      )
  }
}
