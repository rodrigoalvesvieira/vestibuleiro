require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:question, Question.new(
      :title => "MyString",
      :body => "MyText",
      :tags => "MyString",
      :user_id => 1
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input#question_title[name=?]", "question[title]"

      assert_select "textarea#question_body[name=?]", "question[body]"

      assert_select "input#question_tags[name=?]", "question[tags]"

      assert_select "input#question_user_id[name=?]", "question[user_id]"
    end
  end
end
