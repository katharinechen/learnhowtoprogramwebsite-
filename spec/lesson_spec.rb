require 'rails_helper'

describe "Lesson" do

  it "validates the presence of name" do
    new_lesson = Lesson.new({name: "Learn Ruby", content: "blah blah blah", number: 3})
    expect(new_lesson.save).to eq true

    new_lesson1 = Lesson.new({content: "Blah blah", number: 2})
    expect(new_lesson1.save).to eq false
  end

  it "validates the presence of content" do
    new_lesson1 = Lesson.new({name: "Learn Ruby", number: 2})
    expect(new_lesson1.save).to eq false
  end

  it "validates number" do
    new_lesson1 = Lesson.new({name: "Learn Ruby", content: "blahlalha", number: "abc"})
    expect(new_lesson1.save).to eq false
    new_lesson2 = Lesson.new({name: "Learn Ruby", content: "blahlalha"})
    expect(new_lesson2.save).to eq false
  end

  context '#sort' do
    it 'sorts all the lessons by lesson number.' do
      current_lesson = Lesson.create({:name => 'lesson1', content: "blahlalha", :number => 1})
      last_lesson = Lesson.create({:name => 'lesson3', content: "blahlalha", :number => 3})
      middle_lesson = Lesson.create({:name => 'lesson2', content: "blahlalha", :number => 2})
      expect(Lesson.all).to eq [current_lesson, middle_lesson, last_lesson]
    end
  end

  # context '#next' do
  #   it 'returns the lesson with the next-highest number than the current lesson' do
  #     current_lesson = Lesson.create({:name => 'lesson1', content: "blahlalha", :number => 1})
  #     next_lesson = Lesson.create({:name => 'lesson2', content: "blahlalha", :number => 2})
  #     current_lesson.next.should eq next_lesson
  #   end
  # end

end
