class Word < ActiveRecord::Base
  attr_accessible :is_common, :search_count, :word
  # has_and_belongs_to_many :artists

	has_many :worduses
  has_many :musicians, :through => :worduses

end


