require 'rails_helper'

RSpec.describe "homepages/index", type: :view do
  before(:each) do
    assign(:homepages, [
      Homepage.create!(
        about: "About",
        aboutcontentone: "Aboutcontentone",
        aboutcontenttwo: "Aboutcontenttwo",
        emailone: "Emailone",
        emailtwo: "Emailtwo",
        emailthree: "Emailthree",
        emailfour: "Emailfour",
        emailfive: "Emailfive",
        contact: "Contact",
        contactcontent: "Contactcontent",
        imageone: "Imageone",
        imagetwo: "Imagetwo",
        imagethree: "Imagethree"
      ),
      Homepage.create!(
        about: "About",
        aboutcontentone: "Aboutcontentone",
        aboutcontenttwo: "Aboutcontenttwo",
        emailone: "Emailone",
        emailtwo: "Emailtwo",
        emailthree: "Emailthree",
        emailfour: "Emailfour",
        emailfive: "Emailfive",
        contact: "Contact",
        contactcontent: "Contactcontent",
        imageone: "Imageone",
        imagetwo: "Imagetwo",
        imagethree: "Imagethree"
      )
    ])
  end

  it "renders a list of homepages" do
    render
    assert_select "tr>td", text: "About".to_s, count: 2
    assert_select "tr>td", text: "Aboutcontentone".to_s, count: 2
    assert_select "tr>td", text: "Aboutcontenttwo".to_s, count: 2
    assert_select "tr>td", text: "Emailone".to_s, count: 2
    assert_select "tr>td", text: "Emailtwo".to_s, count: 2
    assert_select "tr>td", text: "Emailthree".to_s, count: 2
    assert_select "tr>td", text: "Emailfour".to_s, count: 2
    assert_select "tr>td", text: "Emailfive".to_s, count: 2
    assert_select "tr>td", text: "Contact".to_s, count: 2
    assert_select "tr>td", text: "Contactcontent".to_s, count: 2
    assert_select "tr>td", text: "Imageone".to_s, count: 2
    assert_select "tr>td", text: "Imagetwo".to_s, count: 2
    assert_select "tr>td", text: "Imagethree".to_s, count: 2
  end
end
