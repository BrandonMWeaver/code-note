class Post < ApplicationRecord

	belongs_to :user
	belongs_to :language
	
	validates :title, presence: true
	validates :content, length: { minimum: 10 }
	validates :description, length: { minimum: 10 }

	scope :find_by_language, -> language { where("language_id = ?", language.id) }
	
end
