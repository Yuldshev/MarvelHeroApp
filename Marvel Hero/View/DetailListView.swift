import SwiftUI

struct DetailListView: View {
  var heroes: [Hero] = mockHeroes
  var columns = [
    GridItem(.flexible(), spacing: 16),
    GridItem(.flexible(), spacing: 16)
  ]
  
  var body: some View {
    ScrollView(.vertical) {
      LazyVGrid(columns: columns, spacing: 16) {
        ForEach(heroes) { hero in
          HeroBigCard(image: hero.images.lg, name: hero.name, comicsName: hero.biography.fullName)
        }
      }
      .padding(.horizontal, 24)
      .padding(.vertical, 24)
    }
    .clipped()
  }
}

#Preview {
  DetailListView()
}
