import Foundation

struct AboutApp: Identifiable {
  let id = UUID()
  let header: String
  let text: String
}

let aboutAppItem: [AboutApp] = [
  AboutApp(header: "Terms of Use", text:
  """
  Marvel Hero is an educational and fan-made application that provides detailed information about Marvel superheroes. The application is developed for personal and practical learning purposes only.
  
  By using this application, you agree to the following terms:
  
  - The content provided in the application is for informational and educational use only.
  - This application is not affiliated with, endorsed by, or associated with Marvel Entertainment, LLC, or The Walt Disney Company.
  - All hero names, images, and descriptions are the intellectual property of their respective owners.
  - The application does not collect, store, or share any personal user data.
  - You may not use the app for commercial purposes or claim ownership of the provided content.
  
  We reserve the right to update these Terms of Use without prior notice.
  """
  ),
  
  AboutApp(header: "Privacy Policy", text:
  """
  Marvel Hero does not collect, store, or process any personal information from users.
     
  - No personal data, search history, or usage data is collected.
  - The app does not use cookies, analytics, or third-party tracking.
  - All data displayed in the app is retrieved from the public API: Superhero API.
  - Since no personal information is collected, there is no risk of unauthorized data sharing or leakage.
  
  If you have any questions about this privacy policy, please contact the developer directly.
  """
  ),
  
  AboutApp(header: "About", text:
  """
  Marvel Hero is an educational, fan-made app that provides detailed profiles, filtering, and categorization of Marvel heroes.
  The app is built for practical development purposes and is not an official Marvel product.
    
  Key Features:
  - Browse heroes from the Marvel Universe.
  - Filter heroes by categories such as villains, anti-heroes, aliens, and humans.
  - Search heroes by name or biography.
    
  Disclaimer: This app is not affiliated with Marvel Entertainment, LLC or The Walt Disney Company. All content is used under fair use for educational purposes.
  """
  )
]
