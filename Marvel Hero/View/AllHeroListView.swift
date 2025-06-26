import SwiftUI
import SwiftfulUI

struct AllHeroListView: View {
  @Binding var vm: HeroViewModel
  @State var offset: CGPoint = .zero
  @Environment(\.router) var router
  
  let columns = [
    GridItem(.flexible(), spacing: 16),
    GridItem(.flexible(), spacing: 16)
  ]
  
  var body: some View {
    ScrollViewWithOnScrollChanged {
      LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
        Section {
          DetailListView(heroes: vm.filteredCategory(vm.selectedCategory, limit: offset.y < -200 ? nil : 8))
        } header: {
          header
        }
      }
    } onScrollChanged: { origin in
      offset = origin
    }
    .scrollIndicators(.hidden)
    .toolbar(.hidden, for: .navigationBar)
    .clipped()
    .swipeBackGesture()
    .animation(.easeInOut, value: offset)
    .animation(.easeInOut, value: vm.selectedCategory)
  }
  
  private var header: some View {
    VStack {
      Image(systemName: "chevron.left")
        .asButton(.press) { router.dismissScreen() }
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(alignment: .center) {
          Text("All Heroes")
            .gilroyHeavy(size: .small)
        }
      
      CategoryTextView(selectedCategory: $vm.selectedCategory)
    }
      .background(offset.y < -20 ? .white : .clear)
      .overlay(alignment: .bottom) {
        if offset.y < -20 {
          Rectangle()
            .frame(height: 1)
            .foregroundStyle(.appGrey)
        }
      }
  }
}

struct CategoryTextView: View {
  @Binding var selectedCategory: HeroCategory
  
  var body: some View {
    HStack {
      ScrollView(.horizontal) {
        HStack(spacing: 0.0) {
          ForEach(HeroCategory.allCases, id: \.rawValue) { item in
            Button { selectedCategory = item } label: {
              Text(item.title)
                .foregroundStyle(selectedCategory == item ? .white : .black)
                .gilroyMedium(size: .small)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .lineLimit(1)
                .withBackground(color: selectedCategory == item ? .appRed : .appSilver, cornerRadius: 8)
            }
            .containerRelativeFrame(.horizontal, count: 4, spacing: 0)
            .scrollTransition { content, phase in
              content
                .opacity(phase.isIdentity ? 1 : 0.8)
                .scaleEffect(phase.isIdentity ? 1 : 0.9)
                .blur(radius: phase.isIdentity ? 0 : 1)
            }
          }
        }
        .scrollTargetLayout()
      }
      .contentMargins(.horizontal, 24, for: .automatic)
      .scrollTargetBehavior(.viewAligned)
      .animation(.spring(), value: selectedCategory)
    }
    .padding(.vertical)
  }
}

#Preview {
  AllHeroListView(vm: .constant(HeroViewModel()))
    .previewRouter()
}
