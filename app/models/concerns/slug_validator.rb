class SlugValidator < ActiveModel::Validator

	def validate(record)
		User.all.each do |user|
			if record.username == user.slug
				record.errors.add(:username, "has already been taken")
			end
		end
	end

end
