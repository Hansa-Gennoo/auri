import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme"
export default class extends Controller {
  static targets = ["selector"]
  static values = { current: String }

  connect() {
    console.log("Theme controller connected.")
  }

  change() {
    if (!this.hasSelectorTarget) return

    const selectedThemeKey = this.selectorTarget.value
    this.applyTheme(selectedThemeKey)
  }

  applyTheme(themeKey) {
    // Fetch theme data dynamically from a global JS variable or API
    fetch(`/themes/${themeKey}.json`)
      .then(response => response.json())
      .then(theme => {
        document.documentElement.style.setProperty("--background-colour", theme.background_colour)
        document.documentElement.style.setProperty("--primary-colour", theme.primary_colour)
        document.documentElement.style.setProperty("--accent-colour", theme.accent_colour)
        document.documentElement.style.setProperty("--font-heading", theme.font_heading)
        document.documentElement.style.setProperty("--font-body", theme.font_body)
      })
      .catch(error => console.error("Error applying theme:", error))
  }
}
