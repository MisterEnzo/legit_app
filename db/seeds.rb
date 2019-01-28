puts "Creating sample users.."
3.times do |user|
  User.create!(
    email: "user#{user}@legit.com",
    password: 123123
  )
end
puts "Created users."

puts "Creating companies..."
5.times do |company|
  name = Faker::Company.name.downcase.gsub(/[^0-9A-Za-z]/, '')
  Company.create!(
    name: name,
    email: "contact@#{name}.com",
    password: 123123,
    address: Faker::Address.full_address,
    telephone: Faker::Number.number(7)
  )
end
puts "Created companies."

puts "Creating sample reviews.."
6.times do |review|
  Review.create!(
    title: "Review ##{review + 1}",
    content: Faker::Hobbit.quote,
    user_id: 1,
    company_id: 1
  )
end
puts "Created reviews."