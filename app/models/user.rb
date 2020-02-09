class User < ApplicationRecord

	has_secure_password

	has_many :posts
	has_many :languages, through: :posts
	
	validates :username, presence: true
	validates :username, uniqueness: true
	validates :password, length: { minimum: 5 }
	
	def slug
		return self.username.gsub(' ', '-').downcase
	end

	def self.find_by_slug(string)
		return self.all.select { |instance| instance.slug == string }.first
	end

end
