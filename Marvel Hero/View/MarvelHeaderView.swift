import SwiftUI
import SwiftfulUI

struct MarvelHeaderView: View {
  @Binding var offset: CGPoint
  @Binding var vm: HeroViewModel
  @State private var isSearch = false
  @Environment(\.router) var router
  
  var body: some View {
    HStack {
      if !isSearch {
        Image(systemName: "line.3.horizontal")
          .asButton(.press) {
            router.showModal(transition: .move(edge: .top), alignment: .top, backgroundColor: .appDark.opacity(0.8), ignoreSafeArea: true) {
              MenuBar(vm: $vm)
            }
          }
        
        Image(systemName: "magnifyingglass")
          .padding(8)
          .offset(x: 8)
          .frame(maxWidth: .infinity, alignment: .trailing)
          .asButton {
            isSearch.toggle()
          }
      } else {
        HStack {
          Image(systemName: "magnifyingglass")
          
          TextField("Search...", text: $vm.searchText)
            .gilroySemibold()
          
          Image(systemName: "xmark")
            .asButton {
              vm.searchText = ""
              isSearch.toggle()
            }
        }
        .transition(.move(edge: .trailing))
        .padding(.horizontal, 16)
        .frame(height: 34)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.appSilver)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
      }
    }
    .padding(.horizontal, 24)
    .frame(height: 64)
    .background(.white)
    .animation(.easeIn, value: isSearch)
    .overlay(alignment: .center) {
      VStack {
        if !isSearch {
          Image(.logo)
        }
      }
      .foregroundStyle(.appRed)
      .opacity(isSearch ? 0 : 1)
      .animation(.easeIn, value: isSearch)
    }
    .overlay(alignment: .bottom) {
      if offset.y < -20 {
        Rectangle()
          .frame(height: 0.6)
          .foregroundStyle(.appGrey)
      }
    }
  }
}

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()
    
    MarvelHeaderView(offset: .constant(.zero), vm: .constant(HeroViewModel()))
  }
  .previewRouter()
}
