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
      guild_id: [1, 2].sample,
      wallet: "sample_wallet_address",
      image: "https://robohash.org/#{rand(9999)}"  
    )
  end

  # add alice, bob example accounts as guild admins
  User.create(
    email: "alice@example.com",
    password: "password",
    username: "alice",
    guild_id: 1,
    wallet: "0x3dBa039281032Ee619E7b4C0b1E7C9A4d56187AA",
    image: "https://robohash.org/#{rand(9999)}"
  )

  User.create(
    email: "bob@example.com",
    password: "password",
    username: "bob",
    guild_id: 2,
    wallet: "0x71aa6336ae01c1293018993a505e9f368b68b518",
    image: "https://robohash.org/#{rand(9999)}"
  )
  
  users = User.all

  # create 2 guilds with alice and bob as admins

end