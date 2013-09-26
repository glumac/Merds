class Worduse < ActiveRecord::Base
  attr_accessible :name, :count, :musician_id, :word_id
  
  belongs_to :musician
  belongs_to :word

end

