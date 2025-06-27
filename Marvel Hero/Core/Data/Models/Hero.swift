import Foundation

struct Hero: Identifiable, Codable, Equatable {
  let id: Int
  let name: String
  let slug: String?
  let powerstats: Powerstats
  let appearance: Appearance
  let biography: Biography
  let work: Work?
  let connections: Connections?
  let images: Images
}

// MARK: - Appearance
struct Appearance: Codable, Equatable {
  let gender, race: String?
  let height, weight: [String]
  let eyeColor, hairColor: String?
}

// MARK: - Biography
struct Biography: Codable, Equatable {
  let fullName: String
  let alterEgos: String?
  let aliases: [String]
  let placeOfBirth, firstAppearance, publisher, alignment: String?
}

// MARK: - Connections
struct Connections: Codable, Equatable {
  let groupAffiliation, relatives: String
}

// MARK: - Images
struct Images: Codable, Equatable {
  let xs, sm, md: String?
  let lg: String
}

// MARK: - Powerstats
struct Powerstats: Codable, Equatable {
  let intelligence, strength, speed, durability: Int
  let power, combat: Int
  
  var asArray: [(title: String, value: Int)] {
    [
      ("Intelligence", intelligence),
      ("Strength", strength),
      ("Speed", speed),
      ("Durability", durability),
      ("Power", power),
      ("Combat", combat)
    ]
  }
}

// MARK: - Work
struct Work: Codable, Equatable {
  let occupation, base: String
}
