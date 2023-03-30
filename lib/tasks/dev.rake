namespace :dev do
  desc "Configure the development environment..."
  task setup::environment do
    puts "Creating and registering contacts..."
    puts "------------------------------------"
    puts "Registering the types of contacts..."

    kinds = %w(Friend Comercial Emergency)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    5.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 2.days.ago, to: Date.today),
        kind: Kind.all.sample
      )
    end
    puts "------------------------------------"
    puts "Registered contacts..."
  end
end
