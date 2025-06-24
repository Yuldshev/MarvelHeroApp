import Foundation

struct Hero: Identifiable, Codable {
    let id: Int
    let name, slug: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let work: Work
    let connections: Connections
    let images: Images
}

// MARK: - Appearance
struct Appearance: Codable {
    let gender, race: String?
    let height, weight: [String]
    let eyeColor, hairColor: String?
}

// MARK: - Biography
struct Biography: Codable {
    let fullName, alterEgos: String?
    let aliases: [String]
    let placeOfBirth, firstAppearance, publisher, alignment: String?
}

// MARK: - Connections
struct Connections: Codable {
    let groupAffiliation, relatives: String
}

// MARK: - Images
struct Images: Codable {
    let xs, sm, md, lg: String
}

// MARK: - Powerstats
struct Powerstats: Codable {
    let intelligence, strength, speed, durability: Int
    let power, combat: Int
}

// MARK: - Work
struct Work: Codable {
    let occupation, base: String
}
