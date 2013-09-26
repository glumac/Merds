class Worduse < ActiveRecord::Base
  attr_accessible :name, :count
  
  belongs_to :artist
  belongs_to :word

end

