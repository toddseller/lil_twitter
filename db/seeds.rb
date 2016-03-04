30.times { User.create(full_name: Faker::Name.name, email: Faker::Internet.email, username: Faker::Internet.user_name, password: Faker::Internet.password) }

