require 'faker'

User.create(full_name: "Coline F", username: "coline", password: "coline",email: "coline@gmail.com")
User.create(full_name: "Joey F", username: "joey", password: "joey",email: "joey@gmail.com")
User.create(full_name: "billy F", username: "billy", password: "billy",email: "billy@gmail.com")
User.create(full_name: "jimmy F", username: "jimmy", password: "jimmy",email: "jimmy@gmail.com")
User.create(full_name: "donald F", username: "donald", password: "donald",email: "donald@gmail.com")
User.create(full_name: "james F", username: "james", password: "james",email: "james@gmail.com")
30.times { Tweet.create(user_id: rand(1..6), description: Faker::Hipster.sentence)}