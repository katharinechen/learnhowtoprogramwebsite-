class Section < ActiveRecord::Base

  validates :name, :presence => true
  validates :number, :presence => true, numericality: { only_integer: true }

  has_many :lessons

  default_scope { order('number')}

  @current_section_index = nil

  def get_current_section_index
    Section.all.each_with_index do |section, i|
      if (self == section)
        @current_section_index = i
        break
      end
    end
  end

  def next
    get_current_section_index

    if @current_section_index < (Section.all.length - 1)
      Section.all[@current_section_index + 1]
    else
      Section.all[@current_section_index]
    end
  end

  def prev
    get_current_section_index

    if @current_section_index > 0
      Section.all[@current_section_index - 1]
    else
      Section.all[@current_section_index]
    end
  end

end
