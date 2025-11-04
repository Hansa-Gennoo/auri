# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Theme.create!(
  name: "Calm Minimal",
  key: "calm_minimal",
  background_colour: "#F7F7F8",
  primary_colour: "#1E1E1E",
  accent_colour: "#A78BFA",
  font_heading: "Playfair Display",
  font_body: "Inter"
)

Theme.create!(
  name: "Golden Hour",
  key: "golden_hour",
  background_colour: "#FFF7E8",
  primary_colour: "#3B2F2F",
  accent_colour: "#F7A072",
  font_heading: "Cormorant Garamond",
  font_body: "Poppins"
)

Theme.create!(
  name: "Coastal Breeze",
  key: "coastal_breeze",
  background_colour: "#E9F5F9",
  primary_colour: "#1E3D58",
  accent_colour: "#6BAED6",
  font_heading: "Lora",
  font_body: "Nunito"
)

Theme.create!(
  name: "Playful Pastels",
  key: "playful_pastel",
  background_colour: "#FDF6F0",
  primary_colour: "#2F2E41",
  accent_colour: "#A1C4FD",
  font_heading: "Quicksand",
  font_body: "Mulish"
)

Theme.create!(
  name: "Midnight Studio",
  key: "midnight_studio",
  background_colour: "#1A1A1A",
  primary_colour: "#EAEAEA",
  accent_colour: "#9B5DE5",
  font_heading: "Playfair Display",
  font_body: "Outfit"
)

Theme.create!(
  name: "Serene Bloom",
  key: "serene_bloom",
  background_colour: "#FAFAFA",
  primary_colour: "#4C4C4C",
  accent_colour: "#B3A0CD",
  font_heading: "DM Serif Display",
  font_body: "Source Sans Pro"
)

puts "Seeds were created successfully!"
