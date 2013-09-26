class Musician < ActiveRecord::Base
  attr_accessible :name, :search_count

  # has_and_belongs_to_many :words

  has_many :worduses
  has_many :words, :through => :worduses

end

