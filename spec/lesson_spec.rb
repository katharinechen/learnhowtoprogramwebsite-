require 'rails_helper'

describe "Lesson" do

  it "validates the presence of name" do
    new_lesson = Lesson.new({name: "Learn Ruby", content: "blah blah blah"})
    expect(new_lesson.save).to eq true

    new_lesson1 = Lesson.new({content: "Blah blah"})
    expect(new_lesson1.save).to eq false
  end

  it "validates the presence of content" do
    new_lesson1 = Lesson.new({name: "Learn Ruby"})
    expect(new_lesson1.save).to eq false
  end

end
