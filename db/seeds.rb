User.destroy_all
Invention.destroy_all

5.times do
    User.create(name: Faker::Fantasy::Tolkien.character,
        username: Faker::Fantasy::Tolkien.character,
        password_digest: "password")
end

20.times do
    Invention.create(title: Faker::Appliance.equipment,
        description: Faker::Movie.quote,
        relevant_field: Faker::IndustrySegments.sector,
        date_of_conception: Time.now,
        patent_filed: [true, false].sample)
end

puts "seeds planted"