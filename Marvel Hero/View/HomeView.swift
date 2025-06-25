import SwiftUI
import SwiftfulUI

struct HomeView: View {
  @State var vm = HeroViewModel()
  
  var body: some View {
    ScrollView(.vertical) {
      VStack(spacing: 0) {
        Header
        Title
        SelectCategory(vm: $vm)
      }
    }
    .scrollIndicators(.hidden)
    .clipped()
  }
  
  private var Header: some View {
    HStack {
      Image(systemName: "line.3.horizontal")
        .frame(width: 24, height: 24)
        .asButton(.opacity) {
          //TODO: - MenuBar
        }
      
      Spacer()
      
      Image(systemName: "magnifyingglass")
        .frame(width: 24, height: 24)
        .asButton(.press) {
          //TODO: - Search
        }
    }
    .padding(.horizontal, 24)
    .frame(height: 64)
    .overlay(alignment: .center) {
      Image(.logo)
        .foregroundStyle(.appRed)
    }
  }
  
  private var Title: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("Welcome to Marvel Heroes")
        .gilroySemibold()
        .foregroundStyle(.appGrey)
      Text("Choose your character")
        .gilroyHeavy(size: .large)
    }
    .padding(24)
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

#Preview {
  HomeView()
}
