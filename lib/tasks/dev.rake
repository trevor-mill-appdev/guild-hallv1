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

  # generate set users alice and bob for guild admin accounts

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



  # create materials
  Material.create(
    name: "Grimweed",
    token_address: "0x06F34105B7DfedC95125348A8349BdA209928730"
  )

  Material.create(
    name: "Eye of Newt",
    token_address: "0x1346FdB62241e238Be9F84A2FC364c0657757015"
  )

  Material.create(
    name: "Minor Health Potion",
    token_address: "0x919b22450c38108bb624c4c72b085cd7c0442b80"
  )

  Material.create(
    name: "Basic Health Potion",
    token_address: "0xe3d73635cf43551d245a551c8cf909a8475299bb"
  )

  Material.create(
    name: "Sporebark",
    token_address: "0xe0df35dd951aea2edb96eae88e7e0652a1729acc"
  )

  Material.create(
    name: "$Aurum",
    token_address: "0x34d4ab47bee066f361fa52d792e69ac7bd05ee23"
  )

  Material.create(
    name: "$Raider",
    token_address: "0xcd7361ac3307d1c5a46b63086a90742ff44c63b3"
  )

  materials = Material.all

  # create guilds
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
  guild_list = Array.new
  guilds.each do |guild|
    guild_list << guild.id
  end

  # generate random users sorted between the guilds

  usernames.each do |username|
    User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username.downcase,
      image: "https://robohash.org/#{rand(9999)}",
      wallet: "sample_wallet_address",
      guild_id: guild_list.sample
    )
    end

  users = User.all
  
  # create raiders and mobs for users
  users.each do |user|
    rand(10).times do
      user.raiders.create(
        serial: rand(9999),
        image: "https://loremflickr.com/320/320?random=#{rand(999)}",
        owner_id: user.id
      )
    end

    rand(3).times do
      user.mobs.create(
        owner_id: user.id,
        serial: rand(9999),
        image: "https://placekitten.com"
      )
    end
  end

  

  # create stashes for users
  users.each do |user|
    materials.each do |material|
      user.stashes.create(
        owner_id: user.id,
        material_id: material.id,
        quantity: rand(100)
      )
    end
  end

  # create props for users
  users.each do |user|
    if rand < 0.25
      Proposal.create(
        proposer_id: user.id,
        guild_id: user.guild_id,
        status: "pending",
        body: Faker::Lorem.paragraph(sentence_count: 3)
      )
    end
  end

  # create votes for props
  guilds.each do |guild|
    guild.proposals.each do |proposal|
      guild.members.each do |member|
        if rand < 0.75
          Vote.create(
            voter_id: member.id,
            proposal_id: proposal.id,
            value: ["abstain", "nay", "yay"].sample
          )
        end
      end
    end
  end

  raiders = Raider.all
  mobs = Mob.all
  stashes = Stash.all
  votes = Vote.all
  proposals = Proposal.all

  ending = Time.now
  p "It took #{(ending - starting).to_i} seconds to create sample data."
  p "There are now #{User.count} users."
  p "There are now #{Guild.count} guilds."
  p "There are now #{Raider.count} raiders."
  p "There are now #{Mob.count} mobs."
  p "There are now #{Stash.count} stashes."
  p "There are now #{Vote.count} votes on #{Proposal.count} proposals."

end