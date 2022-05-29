json.extract! vote, :id, :voter_id, :proposal_id, :value, :created_at, :updated_at
json.url vote_url(vote, format: :json)
