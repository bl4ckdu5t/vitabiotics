class User < ActiveRecord::Base

	attr_accessor :password
	before_save :encrypt_password

	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :email
	validates_uniqueness_of :email
	has_attached_file :avatar, bucket: 'vitabiotics-assets', styles: {
		thumb: '100x100>',
		square: '200x200#',
		medium: '300x300>'
	}
	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end
end
