class Topic < ApplicationRecord
  validates_inclusion_of :title
  has_many :blogs
end
