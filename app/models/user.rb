class User < ActiveRecord::Base

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook,:google_oauth2]
	
  has_many :properties, dependent: :destroy
  has_many :user_identities, dependent: :destroy

	before_save { self.email = email.downcase }
  has_many :follows, :dependent => :destroy
	

	def self.find_for_facebook_or_google_oauth(auth, signed_in_resource=nil)
 	  user_identity = UserIdentity.find_by_provider_and_uid(auth.provider,auth.uid)
    if user_identity.blank?
      user = User.find_by_email(auth[:extra][:raw_info][:email]) if !auth[:extra].blank? && !auth[:extra][:raw_info].blank? && !auth[:extra][:raw_info][:email].blank?
      user_identity = UserIdentity.create(:provider=>auth.provider,:uid=>auth.uid,:user_id=>user.id) unless user.blank?
    end  
    return user_identity.blank? ? nil : user_identity.user
  end

  def self.new_with_session(params, session)
    super.tap do |user|          
      if data = session["devise.data"] && session["devise.data"]["extra"]["raw_info"]      
        user.email = data["email"] if user.email.blank?
      end
    end
  end

	


  def feed
  	Property.where("user_id = ?", id)
  end
  
 
	
end
