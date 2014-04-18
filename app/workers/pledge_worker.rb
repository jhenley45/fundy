class PledgeWorker
	@queue = :pledges

	def self.perform(gift_id)
		gift = gift.find(gift_id)
		gift.charge_gift_pledges
		puts 'THIS IS WORKING'
	end


end
