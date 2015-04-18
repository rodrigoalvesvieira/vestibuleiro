require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        :title => "Title",
        :body => "MyText",
        :tags => "Tags",
        :user_id => 1
      ),
      Question.create!(
        :title => "Title",
        :body => "MyText",
        :tags => "Tags",
        :user_id => 1
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Tags".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
