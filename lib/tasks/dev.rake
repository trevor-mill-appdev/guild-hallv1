desc "Fill the database tables with sample data"

task :sample_data do
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

  10.times do |username|
    User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username.downcase,
      guild_id: [1, 2, 3].sample,
      wallet: "sample_wallet_address",
      image: "https://robohash.org/#{user.id}"  
    )
  end
end