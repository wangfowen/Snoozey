class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
  #devise :omniauthable

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me
  has_one :wall_post

  validates :access_token, :presence => true

  APP_SECRET = "8616cc121111c56b67458c3f838b2425"

	def self.base64_url_decode(str)
		str += '=' * (4 - str.length.modulo(4))
		Base64.decode64(str.tr('-_','+/'))
	end

	def self.load_signed_request(request)
	    encoded_sig, payload = request.split(".")
	    sig = base64_url_decode(encoded_sig)

	    if OpenSSL::HMAC.digest("sha256", APP_SECRET, payload) == sig
	      decoded = base64_url_decode(payload)
	      data = JSON.parse(decoded)
	      if user = User.find_by_user_id(data["user_id"])
	      	user
	      else
	      	user = User.new(:user_id => data["user_id"], :access_token => data["oauth_token"])
	      	user.save!
	      	user
	      end
	    else
	      nil
	    end
	end
end
