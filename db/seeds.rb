30.times { User.create(full_name: Faker::Name.name, email: Faker::Internet.email, username: Faker::Internet.user_name, password: Faker::Internet.password) }

30.times { Tweet.create(user_id: rand(1..31), description: Faker::Hipster.sentence) }

30.times { Follower.create(follower_id: rand(1..99), followee_id: rand(1..99)) }
