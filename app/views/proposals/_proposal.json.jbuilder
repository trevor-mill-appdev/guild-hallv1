json.extract! proposal, :id, :proposer_id, :guild_id, :status, :body, :created_at, :updated_at
json.url proposal_url(proposal, format: :json)
