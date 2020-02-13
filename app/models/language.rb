class Language < ApplicationRecord

	has_many :posts
	has_many :users, through: :posts
	
	validates :name, presence: true
	
	LANGUAGE_NAMES = [
		"C/C++",
		"C#",
		"Ruby"
	]

	def self.populate
		LANGUAGE_NAMES.each do |language_name|
			self.find_or_create_by(name: language_name)
		end
	end

end
