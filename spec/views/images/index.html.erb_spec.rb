require 'rails_helper'

RSpec.describe "images/index", type: :view do
  before(:each) do
    assign(:images, [
      Image.create!(
        name: "Name"
      ),
      Image.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of images" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
