class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  has_many :maps

  # def self.find_for_google_oauth2(auth, signed_in_user=nil)
  #   if user = signed_in_user || User.find_by_email(auth.info.email)
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.name = auth.info.name if user.name.blank?
  #     user.image = auth.info.image if user.image.blank?
  #     user.save
  #     user
  #   else
  #     where(auth.slice(:provider, :uid)).first_or_create do |user|
  #       user.provider = auth.provider
  #       user.uid = auth.uid
  #       user.name = auth.info.name
  #       user.image = auth.info.image
  #       user.email = auth.info.email
  #       # user.password = Devise.friendly_token[0, 20]
  #       user.skip_confirmation!
  #     end
  #   end
  # end

  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if auth = session["devise.google_data"]
  #       user.name = auth.info.name if user.name.blank?
  #       user.image = auth.info.image if user.image.blank?
  #       user.email = auth.info.email if user.email.blank?
  #       user.skip_confirmation!
  #     end
  #   end
  # end

end


