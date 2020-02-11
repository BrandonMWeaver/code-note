class User < ApplicationRecord

	has_secure_password

	has_many :posts
	has_many :languages, -> { distinct }, through: :posts
	
	validates_with SlugValidator
	
	validates :username, length: { minimum: 3 }
	validates :username, uniqueness: true
	validates :password, length: { minimum: 5 }

	def slug
		return self.username.gsub(' ', '-').downcase
	end

	def self.find_by_slug(string)
		return self.all.select { |instance| instance.slug == string }.first
	end

end
