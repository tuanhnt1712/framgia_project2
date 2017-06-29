require "rails_helper"

RSpec.describe "static_pages/contact.html.erb", type: :view do
  include RSpecHtmlMatchers

  it "has tag" do
    render
    expect(rendered).to have_tag("h1", "Contact me")
  end
end
