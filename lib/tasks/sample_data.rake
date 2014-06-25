namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Javier Perez",
                 email: "javier@wyncode.co",
                 password: "wyncode400",
                 password_confirmation: "wyncode400",
                 admin: true)
    10.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end  
  end
end