class Language < ApplicationRecord

	has_many :posts
	has_many :users, -> { distinct }, through: :posts
	
	validates :name, presence: true
	
	LANGUAGE_NAMES = [
		"C/C++",
		"C#",
		"Java",
		"JavaScript",
		"Python",
		"Ruby"
	]

	def self.populate
		LANGUAGE_NAMES.each do |language_name|
			self.find_or_create_by(name: language_name)
		end
	end

	def slug
		return self.name.gsub(' ', '-').downcase
	end

	def self.find_by_slug(string)
		self.all.select { |instance| instance.slug == string }.first
	end

end
