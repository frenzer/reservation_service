require 'rails_helper'

RSpec.describe "hotels/show", type: :view do
  before(:each) do
    @hotel = assign(:hotel, Hotel.create!(
      :name => "name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/name/)
  end
end
