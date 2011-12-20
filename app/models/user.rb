class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
  #devise :omniauthable

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :wall_posts

  validates :access_token, :presence => true

	def self.load_user(data)
		if user = User.find_by_user_id(data["user_id"])
			user
		else
			user = User.new(:user_id => data["user_id"], :access_token => data["oauth_token"])
			user.save!
			user
		end
	end

	def increment_shame_points!
		self.shame_points++
		self.save!
	end
end
