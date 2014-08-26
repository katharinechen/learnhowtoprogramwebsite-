class Section < ActiveRecord::Base

  validates :name, :presence => true
  validates :number, :presence => true, numericality: { only_integer: true }

  has_many :lessons

  default_scope { order('number')}


end
