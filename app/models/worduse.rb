class Worduse < ActiveRecord::Base
  attr_accessible :name, :count
  
  belongs_to :musician
  belongs_to :word

end

