namespace :seed do
  desc "create a new user"
  task user: :environment do
    User.create!(
      name: "admin",
      password: "12341",
      password_confirmation: "12341",
      level: 1
    )
  end
end
