import SwiftUI
import SwiftfulUI

struct HomeView: View {
  @State var vm = HeroViewModel()
  @State var offset: CGPoint = .zero
  
  var body: some View {
    ScrollViewWithOnScrollChanged {
      LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
        Section {
          Title
            .opacity(offset.y > -20 ? 1 : 0)
            .offset(y: offset.y > -20 ? 0 : -20)
          SelectCategoryView(vm: $vm)
            .offset(y: offset.y > -20 ? 0 : -120)
        } header: {
          Header
        }
      }
    } onScrollChanged: { origin in
      offset = origin
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
    .background(.white)
    .overlay(alignment: .center) {
      Image(.logo)
        .foregroundStyle(.appRed)
    }
    .overlay(alignment: .bottom) {
      if offset.y < -20 {
        Rectangle()
          .frame(height: 0.6)
          .foregroundStyle(.appGrey)
      }
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
