import SwiftUI
import SwiftfulUI

struct HeroView: View {
  @Binding var vm: HeroStore
  @State var offset: CGPoint = .zero
  @Environment(\.router) var router
  
  var body: some View {
    ScrollViewWithOnScrollChanged {
      LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
        Section {
          HeroContent
        } header: {
          HeroHeader(offset: $offset, vm: $vm)
        }
      }
    } onScrollChanged: { origin in
      offset = origin
    }
    .scrollIndicators(.hidden)
    .clipped()
    .toolbar(.hidden, for: .navigationBar)
    .task { await vm.dispatch(intent: .loadHeroes) }
    .onChange(of: vm.state.error) { _, newValue in
      if let error = newValue {
        router.showModal(transition: .move(edge: .top), alignment: .top, backgroundColor: .clear, ignoreSafeArea: true) {
          Text("Error: \(error)")
            .gilroyBold()
            .foregroundStyle(.white)
            .padding(12)
            .padding(.top, 100)
            .frame(maxWidth: .infinity, alignment: .leading)
            .withBackground(color: .appRed, cornerRadius: 12)
            .onAppear { vm.clearEror() }
        }
      }
    }
  }
}

//MARK: - Helper View
extension HeroView {
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
  
  //MARK: - List Logic
  private var HeroContent: some View {
    VStack {
      if vm.searchQuery.isEmpty {
        Title
        SelectCategory(vm: $vm)
        
        HeroGrid(heroes: vm.state.heroes)
          .id(vm.state.heroes.map { $0.id }.hashValue)
          .padding(24)
          .transition(.blurReplace)
          .skeleton(vm.state.isLoading)
      } else {
        HeroGrid(heroes: vm.state.heroes)
          .id(vm.state.heroes.map { $0.id }.hashValue)
          .padding(24)
          .transition(.blurReplace)
          .skeleton(vm.state.isLoading)
      }
    }
    .animation(.easeInOut, value: vm.state.heroes)
  }
}

//MARK: - Preview
#Preview {
  HeroView(vm: .constant(HeroStore()))
    .previewRouter()
}
