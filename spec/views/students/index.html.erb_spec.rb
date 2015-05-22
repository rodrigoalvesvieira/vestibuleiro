require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
                        Student.create!(),
                        Student.create!()
                    ])
  end

  it "renders a list of students" do
    render
  end
end