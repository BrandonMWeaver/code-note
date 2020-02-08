class Post < ApplicationRecord

	belongs_to :user
	belongs_to :language
	
	validates :title, presence: true
	validates :content, length: { minimum: 10 }
	validates :description, length: { minimum: 10 }

end
