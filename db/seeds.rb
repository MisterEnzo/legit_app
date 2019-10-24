puts "Creating sample users.."
5.times do |user|
  User.create!(
    email: "user#{user}@legit.com",
    password: 123123
  )
end
puts "Created users."

puts "Creating sample data..."
Company.create!(
  name: 'Facebook',
  email: 'support@facebook.com',
  password: 123123,
  address: 'Palo Alto, California'
)

Company.create!(
  name: 'Google',
  email: 'support@google.com',
  password: 123123,
  address: 'Mountain View, California'
)

Company.create!(
  name: 'Amazon',
  email: 'support@amazon.com',
  password: 123123,
  address: 'Arlington, Virginia'
)

Company.create!(
  name: 'Apple',
  email: 'support@apple.com',
  password: 123123,
  address: 'Cupertino, California'
)

10.times do |company|
  name = Faker::Company.name.downcase.gsub(/[^0-9A-Za-z]/, '')[0..10]
  Company.create!(
    name: name,
    email: "contact@#{name}.com",
    password: 123123,
    address: Faker::Address.full_address,
    telephone: Faker::Number.number(7)
  )
  quote = Faker::Hobbit.quote
  Review.create!(
    title: "#{quote[0..10]}...",
    content: quote,
    user_id: (rand()*5).ceil,
    company_id: Company.last.id,
    rating: (rand()*5).ceil
  )
  quote = Faker::Hobbit.quote
  Response.create!(
    title: "#{quote[0..10]}...",
    content: quote,
    company_id: Company.last.id,
    review_id: Review.last.id
  )
end
puts "Created sample data."


