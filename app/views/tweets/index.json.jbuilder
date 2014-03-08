json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :user_name, :twitter_id, :tweet
  json.url tweet_url(tweet, format: :json)
end
