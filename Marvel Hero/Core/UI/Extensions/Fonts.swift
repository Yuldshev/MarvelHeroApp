import SwiftUI

extension View {
  func gilroyHeavy(size: GilroyHeavy) -> some View {
    self
      .font(.custom(Gilroy.heavy.name, size: size.rawValue))
  }
  
  func gilroyBold() -> some View {
    self
      .font(.custom(Gilroy.bold.name, size: 18))
  }
  
  func gilroyMedium(size: GilroyMedium) -> some View {
    self
      .font(.custom(Gilroy.medium.name, size: size.rawValue))
  }
  
  func gilroySemibold() -> some View {
    self
      .font(.custom(Gilroy.semibold.name, size: 14))
  }
  
  func gilroyRegular() -> some View {
    self
      .font(.custom(Gilroy.regular.name, size: 12))
  }
}

enum Gilroy: String {
case regular, medium, semibold, bold, heavy
  
  var name: String {
    return "Gilroy-\(rawValue.capitalized)"
  }
}

enum GilroyHeavy: CGFloat {
  case large = 40.0
  case medium = 32.0
  case small = 20.0
}

enum GilroyMedium: CGFloat {
  case large = 16.0
  case medium = 14.0
  case small = 12.0
  case extraSmall = 10.0
}

//Gilroy Font names: ["Gilroy-Regular", "Gilroy-Light", "Gilroy-Medium", "Gilroy-Semibold", "Gilroy-Bold", "Gilroy-Black", "Gilroy-Heavy"]
