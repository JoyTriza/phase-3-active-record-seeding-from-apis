class Spell < ActiveRecord::Base
    puts "Seeding spells..."

    spells.each do |spell|
        response = RestClient.get "https://www.dnd5eapi.co/api/spells/#{spell}"

        spell_hash = JSON.parse(response)
        Spell.create(
        name: spell_hash["name"],
        level: spell_hash["level"],
        description: spell_hash["desc"][0]
  )
end

puts "Done Seeding!"