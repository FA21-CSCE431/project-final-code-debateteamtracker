require 'rails_helper'

RSpec.describe "homepages/new", type: :view do
  before(:each) do
    assign(:homepage, Homepage.new(
      about: "MyString",
      aboutcontentone: "MyString",
      aboutcontenttwo: "MyString",
      emailone: "MyString",
      emailtwo: "MyString",
      emailthree: "MyString",
      emailfour: "MyString",
      emailfive: "MyString",
      contact: "MyString",
      contactcontent: "MyString"
    ))
  end

  it "renders new homepage form" do
    render

    assert_select "form[action=?][method=?]", homepages_path, "post" do

      assert_select "input[name=?]", "homepage[about]"

      assert_select "input[name=?]", "homepage[aboutcontentone]"

      assert_select "input[name=?]", "homepage[aboutcontenttwo]"

      assert_select "input[name=?]", "homepage[emailone]"

      assert_select "input[name=?]", "homepage[emailtwo]"

      assert_select "input[name=?]", "homepage[emailthree]"

      assert_select "input[name=?]", "homepage[emailfour]"

      assert_select "input[name=?]", "homepage[emailfive]"

      assert_select "input[name=?]", "homepage[contact]"

      assert_select "input[name=?]", "homepage[contactcontent]"
    end
  end
end
