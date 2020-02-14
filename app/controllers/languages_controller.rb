class LanguagesController < ApplicationController

	def index
		Language.populate
		@languages = Language.all
	end

end
