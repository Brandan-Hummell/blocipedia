require 'faker'

5.times do
    User.create!(
        email: Faker::Internet.unique.email,
        password: Faker::Internet.password(6, 10),
        role: :standard
    )
end
users = User.all

20.times do
    Wiki.create!(
        title: Faker::Witcher.character,
        body: Faker::Witcher.quote,
        user: users.sample,
        private: false
    )
end
wikis = Wiki.all 

    puts "Created #{users.count} Users"
    puts "Created #{wikis.count} Wikis"