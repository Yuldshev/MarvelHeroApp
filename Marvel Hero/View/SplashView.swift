import SwiftUI

struct SplashView: View {
  @State private var isRed = true
  
  var body: some View {
    ZStack {
      backgroundColor
        .ignoresSafeArea()
      
      Image(.logo)
        .resizable()
        .scaledToFit()
        .frame(width: 120, height: 120)
        .foregroundStyle(logoColor)
        .animation(.easeInOut, value: isRed)
    }
    .task {
      await startAnimation()
    }
  }
  
  private var backgroundColor: Color {
    isRed ? .appRed : .white
  }
  
  private var logoColor: Color {
    isRed ? .white : .appRed
  }
  
  private func startAnimation() async {
    while true {
      try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
      withAnimation(.easeInOut(duration: 1)) {
        isRed.toggle()
      }
    }
  }
}

#Preview {
  SplashView()
}
