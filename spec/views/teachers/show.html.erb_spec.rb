require 'rails_helper'

RSpec.describe "teachers/show", type: :view do
  before(:each) do
    @teacher = assign(:teacher, Teacher.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
