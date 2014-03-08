class TweeterJob
	@queue = :tweeter_retrieval_queue

	def self.perform(user_name)
		client = Twitter::REST::Client.new do |config|
			config.consumer_key        = cons_key
			config.consumer_secret     = cons_sec
			config.access_token        = acc_key
			config.access_token_secret = acc_sec
		end

		@tweets = client.user_timeline[0..4]

		puts @tweets

		@tweets.each do |x|
			puts x.text
		end

	end
end