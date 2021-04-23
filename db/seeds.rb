20.times do |i|
  Post.create(title: Faker::Lorem.sentence(word_count: 3),
    short_description: Faker::Lorem.sentence(word_count: 10),
    content: Faker::Lorem.sentence(word_count: 300))
end
