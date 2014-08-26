require 'rails_helper'

describe "Section" do

  it "should save a new object" do
    new_section = Section.new({name: "Ruby", number: 4})
    expect(new_section.save).to eq true
  end

  it "should validate the presence of name" do
    new_section = Section.new({number: 4})
    expect(new_section.save).to eq false
  end

  it "should validate the presence of number" do
    new_section = Section.new({name: "Ruby"})
    expect(new_section.save).to eq false
  end

  it "should validate the numericality of number" do
    new_section = Section.new({name: "Ruby", number: "one"})
    expect(new_section.save).to eq false
  end

  it "should has_many lessons" do
    new_section = Section.create({name: "Ruby", number: 4})
    new_lesson = Lesson.create({name: "Intro to Ruby", number: 1, content: "Learn to write methods."})
    new_section.lessons << new_lesson
    expect(new_section.lessons).to eq [new_lesson]
  end

  context '#sort' do
    it 'sorts all the sections by section number.' do
      current_section = Section.create({:name => 'section1', :number => 1})
      last_section = Section.create({:name => 'section3', :number => 3})
      middle_section = Section.create({:name => 'section2', :number => 2})
      expect(Section.all).to eq [current_section, middle_section, last_section]
    end
  end

end
