require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        email: "Email",
        name: "Name",
        points: 2,
        priority: 3
      ),
      Member.create!(
        email: "Email",
        name: "Name",
        points: 2,
        priority: 3
      )
    ])
  end

  it "renders a list of members" do
    render
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
