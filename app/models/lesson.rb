class Lesson < ActiveRecord::Base

  validates :name, :presence => true
  validates :content, :presence => true
  validates :number, :presence => true, numericality: { only_integer: true }

  default_scope {order('number')}

end
