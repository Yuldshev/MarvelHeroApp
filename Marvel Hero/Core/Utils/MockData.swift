import Foundation

let mockHeroes: [Hero] = [
  Hero(
    id: 620,
    name: "Spider-Man",
    slug: "620-spider-man",
    powerstats: Powerstats(intelligence: 90, strength: 55, speed: 67, durability: 74, power: 60, combat: 85),
    appearance: Appearance(
      gender: "Male",
      race: "Human",
      height: ["5'10\"", "178 cm"],
      weight: ["165 lb", "75 kg"],
      eyeColor: "Hazel",
      hairColor: "Brown"
    ),
    biography: Biography(
      fullName: "Peter Parker",
      alterEgos: "No alter egos found.",
      aliases: ["Spidey", "Web-Slinger", "Friendly Neighborhood Spider-Man"],
      placeOfBirth: "New York, USA",
      firstAppearance: "Amazing Fantasy #15",
      publisher: "Marvel Comics",
      alignment: "good"
    ),
    work: Work(
      occupation: "Photographer",
      base: "New York City"
    ),
    connections: Connections(
      groupAffiliation: "Member of the Avengers, formerly member of Outlaws, alternate Fantastic Four.",
      relatives: "Richard Parker (father, deceased), Mary Parker(mother, deceased), Benjamin Parker (uncle, deceased), May Parker (aunt), Mary Jane Watson-Parker (wife), May Parker (daughter, allegedly deceased)"
    ),
    images: Images(
      xs: nil,
      sm: nil,
      md: nil,
      lg: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/images/lg/620-spider-man.jpg"
    )
  ),
  
  Hero(
    id: 346,
    name: "Iron Man",
    slug: "346-iron-man",
    powerstats: Powerstats(intelligence: 100, strength: 85, speed: 58, durability: 85, power: 100, combat: 64),
    appearance: Appearance(
      gender: "Male",
      race: "Human",
      height: ["6'1\"", "185 cm"],
      weight: ["225 lb", "102 kg"],
      eyeColor: "Blue",
      hairColor: "Black"
    ),
    biography: Biography(
      fullName: "Tony Stark",
      alterEgos: "No alter egos found.",
      aliases: ["Shellhead", "Golden Avenger"],
      placeOfBirth: "Long Island, New York",
      firstAppearance: "Tales of Suspense #39",
      publisher: "Marvel Comics",
      alignment: "good"
    ),
    work: Work(
      occupation: "Inventor, Industrialist",
      base: "Stark Tower, New York City"
    ),
    connections: Connections(
      groupAffiliation: "Avengers",
      relatives: "Howard Stark (father), Maria Stark (mother), Pepper Potts (partner)"
    ),
    images: Images(
      xs: nil,
      sm: nil,
      md: nil,
      lg: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/images/lg/346-iron-man.jpg"
    )
  )
]

