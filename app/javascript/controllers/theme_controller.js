import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme"
export default class extends Controller {
  static targets = ["selector"]
  static values = { current: String }

  connect() {
    console.log("Theme controller connected.")
    const key = this.data.get("themeKey") // reads data-theme-key
    if (key) {
      this.applyTheme(key)
    }
  }

  change() {
    if (!this.hasSelectorTarget) return;

    const selectedThemeKey = this.selectorTarget.value;
    console.log("Selected theme key:", selectedThemeKey); // <- debug
    this.applyTheme(selectedThemeKey);
  }

 applyTheme(themeKey) {
  fetch(`/themes/${themeKey}.json`)
    .then(response => response.json())
    .then(theme => {
      // 1. Apply preview
      document.documentElement.style.setProperty("--background-colour", theme.background_colour)
      document.documentElement.style.setProperty("--primary-colour", theme.primary_colour)
      document.documentElement.style.setProperty("--accent-colour", theme.accent_colour)
      document.documentElement.style.setProperty("--font-heading", theme.font_heading)
      document.documentElement.style.setProperty("--font-body", theme.font_body)

      // 2. SAVE theme to form
      const hiddenField = document.getElementById("theme_id_field");
      if (hiddenField) {
        hiddenField.value = theme.id;  // <- this is the magic line
      }
    })
    .catch(error => console.error("Error applying theme:", error))
}

}
