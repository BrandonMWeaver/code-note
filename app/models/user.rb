class User < ApplicationRecord

	has_secure_password

	validates :username, presence: true
	validates :username, uniqueness: true
	
	def slug
		return self.username.gsub(' ', '-').downcase
	end

	def self.find_by_slug(string)
		return self.all.select { |instance| instance.slug == string }.first
	end

end
