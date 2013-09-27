class WordsController < ApplicationController


	def index
		@words = Word.all
	end
	
	def edit
  		@word = Word.find(params[:id])
	end

	def update
  		word = Word.find(params[:id])
  		word.update_attributes(params[:word])
  		word.save
  		redirect_to '/words'
	end


	def is_common_word
		word = Word.find(params[:id])
		word.toggle(:is_common)
		word.save
		redirect_to '/words'
	end
	
end




