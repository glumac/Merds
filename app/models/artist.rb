class Artist < ActiveRecord::Base
  attr_accessible :name, :search_count
  has_and_belongs_to_many :words
end

