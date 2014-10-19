class User < ActiveRecord::Base
  
  validates :name, length: { minimum: 3, message: "Must be at least 3 characters." }
  validates :email, uniqueness: true, format: /.+@.+\..+/

  has_many :taken_surveys
  has_many :created_surveys
  has_many :questions, through: :created_surveys
  has_many :choices, through: :questions
  has_many :answers, through: :taken_surveys

	def password 
		@password ||= BCrypt::Password.new(password_hash)
	end

	def password=(new_password)
		@password = BCrypt::Password.create(new_password)
		self.password_hash = @password
	end

	def self.authenticate(password)
		self.password == password
	end

end
