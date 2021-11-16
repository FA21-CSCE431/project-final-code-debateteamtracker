require 'rails_helper'

RSpec.describe "homepages/show", type: :view do
  before(:each) do
    @homepage = assign(:homepage, Homepage.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/About/)
    expect(rendered).to match(/Aboutcontentone/)
    expect(rendered).to match(/Aboutcontenttwo/)
    expect(rendered).to match(/Emailone/)
    expect(rendered).to match(/Emailtwo/)
    expect(rendered).to match(/Emailthree/)
    expect(rendered).to match(/Emailfour/)
    expect(rendered).to match(/Emailfive/)
    expect(rendered).to match(/Contact/)
    expect(rendered).to match(/Contactcontent/)
    expect(rendered).to match(/Imageone/)
    expect(rendered).to match(/Imagetwo/)
    expect(rendered).to match(/Imagethree/)
  end
end
