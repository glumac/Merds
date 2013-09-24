class Word < ActiveRecord::Base
  attr_accessible :is_common, :search_count, :word
  has_and_belongs_to_many :artists
end
