class Portfolio < ApplicationRecord
  include Placeholder
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }
  validates_presence_of :title,:body,:main_image,:thumg_image
  after_initialize :set_defaults
  def set_defaults
    self.main_image ||= Placeholder.image_generator('600','400')
    self.thumg_image ||= Placeholder.image_generator('150','200')



  end
end
