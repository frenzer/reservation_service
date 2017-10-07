require 'rails_helper'

RSpec.describe "hotels/edit", type: :view do
  before(:each) do
    @hotel = assign(:hotel, Hotel.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit hotel form" do
    render

    assert_select "form[action=?][method=?]", hotel_path(@hotel), "post" do

      assert_select "input[name=?]", "hotel[name]"
    end
  end
end
