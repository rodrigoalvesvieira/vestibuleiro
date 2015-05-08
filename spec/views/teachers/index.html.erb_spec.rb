require 'rails_helper'

RSpec.describe "teachers/index", type: :view do
  before(:each) do
    assign(:teachers, [
      Teacher.create!(),
      Teacher.create!()
    ])
  end

  it "renders a list of teachers" do
    render
  end
end
