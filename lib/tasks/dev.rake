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

  15.times do |username|
    usernames << Faker::Name.first_name
  end



   usernames.each do |username|
    User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username.downcase,
      image: "https://robohash.org/#{rand(9999)}",
      wallet: "sample_wallet_address",
      guild_id: rand(2)
    )
    end

  users = User.all
  p(users)

  # create materials
  Material.create(
    name: "grimweed",
    token_address: "0x06F34105B7DfedC95125348A8349BdA209928730"
  )

  Material.create(
    name: "eyeofnewt",
    token_address: "0x1346FdB62241e238Be9F84A2FC364c0657757015"
  )

  Material.create(
    name: "mhp",
    token_address: "0x919b22450c38108bb624c4c72b085cd7c0442b80"
  )

  Material.create(
    name: "bhp",
    token_address: "0xe3d73635cf43551d245a551c8cf909a8475299bb"
  )

  Material.create(
    name: "sporebark",
    token_address: "0xe0df35dd951aea2edb96eae88e7e0652a1729acc"
  )

  materials = Material.all

  # create a guild
  

  p(materials)
  # p(users)

end