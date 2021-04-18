Users.destroy_all
Inventions.destroy_all

5.times do
    Users.create(name: Faker::Fantasy::Tolkien.character,
        username: Faker::Movie.quote,
        password_digest: "password")
end

20.times do
    Inventions.create(title: Faker::Appliance.equipment,
        description: Faker::Movie.quote,
        relevant_field: Faker::IndustrySegments.sector,
        date_of_conception: Time.now,
        patent_filed: [true, false].sample)
end

puts "seeds planted"