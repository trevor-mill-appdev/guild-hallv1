desc "Fill the database tables with sample data"

task sample_data: :environment do
  p "Beep boop beep...creating sample data"

  starting = Time.now

  Bulletin.delete_all
  Vote.delete_all
  Proposal.delete_all
  Stash.delete_all
  Material.delete_all
  Raider.delete_all
  Mob.delete_all
  Guild.delete_all
  User.delete_all

  usernames = Array.new { Faker::Name.first_name }

  # create 10 random users
  10.times do |user|
    usernames << Faker::Name.first_name
  end

  usernames.each do |username|
    User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username.downcase,
      guild_id: [1, 2, 3].sample,
      wallet: "sample_wallet_address",
      image: "https://robohash.org/#{rand(9999)}"  
    )
  end

  users = User.all

  # add alice, bob, charlie example accounts as guild admins
  admins = Array.new
  admins << "alice"
  admins << "bob"
  admins << "charlie"

  p(admins)
end