class WallPost < ActiveRecord::Base

belongs_to :user

UNUSED = '0'
USED = '1'

scope :unposted, where(:status => UNUSED)

def post_to_facebook!
	graph = Koala::Facebook::API.new(user.access_token)
	if graph.put_wall_post(self.post)
		self.status = USED
		self.save!
	else
		Rails.logger.debug "Error occurred while trying to post"
	end
	user.increment_shame_points!
end

end
