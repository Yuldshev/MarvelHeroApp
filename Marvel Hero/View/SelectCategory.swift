import SwiftUI

import SwiftUI

struct SelectCategory: View {
  @Binding var vm: HeroViewModel
  @State private var isSelectedCategory: HeroCategory = .all
  
  var body: some View {
    VStack(spacing: 0) {
      HStack(spacing: 12) {
        IconView(image: Image(.iconKVM), background: isSelectedCategory == .all || isSelectedCategory == .good ? LinearGradient.marvelBlue : LinearGradient.black) {
          selectCategory(.good)
        }
        
        IconView(image: Image(.iconVillains), background: isSelectedCategory == .all || isSelectedCategory == .bad ? LinearGradient.marvelRed : LinearGradient.black) {
          selectCategory(.bad)
        }
        
        IconView(image: Image(.iconMutants), background: isSelectedCategory == .all || isSelectedCategory == .anti ? LinearGradient.marvelPurple : LinearGradient.black) {
          selectCategory(.anti)
        }
        
        IconView(image: Image(.iconAlien), background: isSelectedCategory == .all || isSelectedCategory == .alien ? LinearGradient.marvelGreen : LinearGradient.black) {
          selectCategory(.alien)
        }
        
        IconView(image: Image(.iconHuman), background: isSelectedCategory == .all || isSelectedCategory == .human ? LinearGradient.marvelPink : LinearGradient.black) {
          selectCategory(.human)
        }
      }
      .padding(.top, 8)
      .padding(.horizontal, 24)
      
      VStack(spacing: 0) {
        switch isSelectedCategory {
          case .good:
            GoodHeroList.transition(.blurReplace)
          case .bad:
            BadHeroList.transition(.blurReplace)
          case .anti:
            AntiHeroList.transition(.blurReplace)
          case .alien:
            AlienHeroList.transition(.blurReplace)
          case .human:
            HumanHeroList.transition(.blurReplace)
          case .all:
            VStack(spacing: 0) {
              GoodHeroList
              BadHeroList
              AntiHeroList
              AlienHeroList
              HumanHeroList
            }
            .transition(.blurReplace)
        }
      }
      .animation(.easeInOut, value: isSelectedCategory)
    }
  }
  
  private var GoodHeroList: some View {
    let goodHeroes = vm.filterGoodHeroes()
    return HeroListView(title: "Heroes", heroes: goodHeroes)
  }
  
  private var BadHeroList: some View {
    let badHeroes = vm.filterBadHeroes()
    return HeroListView(title: "Villain", heroes: badHeroes)
  }
  
  private var AntiHeroList: some View {
    let antiHeroes = vm.filterAntiHeroes()
    return HeroListView(title: "Anti Heroes", heroes: antiHeroes)
  }
  
  private var AlienHeroList: some View {
    let alienHeroes = vm.filterAlienHeroes()
    return HeroListView(title: "Alien", heroes: alienHeroes)
  }
  
  private var HumanHeroList: some View {
    let humanHeroes = vm.filterHumanHeroes()
    return HeroListView(title: "Human", heroes: humanHeroes)
  }
  
  private func selectCategory(_ category: HeroCategory) {
    withAnimation(.easeInOut) {
      if isSelectedCategory == category {
        isSelectedCategory = .all
      } else {
        isSelectedCategory = category
      }
    }
  }
}

//MARK: - Enum Category
enum HeroCategory: String, CaseIterable {
  case good, bad, anti, alien, human, all
}

//MARK: - Preview
#Preview {
  ScrollView(.vertical) {
    SelectCategory(vm: .constant(HeroViewModel()))
  }
  .scrollIndicators(.hidden)
}
