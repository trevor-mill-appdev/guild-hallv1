desc "Fill the database tables with sample data"

task sample_data: :environment do
  require 'faker'
  
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
    usernames << Faker::Name.first_name
  end

  # generate set users for guild admin accounts

  User.create(
    username: "bob",
    email: "bob@example.com",
    password: "password",
    image: "https://robohash.org/#{rand(9999)}",
    wallet: "0x3dBa039281032Ee619E7b4C0b1E7C9A4d56187AA",
    guild_id: 1
  )

  User.create(
    username: "alice",
    email: "alice@example.com",
    password: "password",
    image: "https://robohash.org/#{9999}",
    wallet: "0x71AA6336aE01c1293018993a505e9F368b68B518",
    guild_id: 2
  )

  # generate random users sorted between the guilds

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
  Guild.create(
    admin_id: User.where(:username => "bob").first.id,
    prop_threshold: rand(3),
    private: false,
    name: "Bob\'s Burgers",
  )

  Guild.create(
    admin_id: User.where(:username => "alice").first.id,
    prop_threshold: rand(3),
    private: true,
    name: "Alice\'s Wonderland"
  )
  guilds = Guild.all
  
  # create raiders and mobs for users
  users.each do |user|
    rand(5).times do
      user.raiders.create(
        serial: rand(9999),
        image: "https://picsum.photos/200/200",
        owner_id: user.id
      )
    end

    rand(3).times do
      user.mobs.create(
        owner_id: user.id,
        serial: rand(9999),
        image: ""
      )
    end
  end

  raiders = Raider.all
  mobs = Mob.all
  p(mobs)
end