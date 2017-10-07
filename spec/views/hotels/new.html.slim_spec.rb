require 'rails_helper'

RSpec.describe "hotels/new", type: :view do
  before(:each) do
    assign(:hotel, Hotel.new(
      :name => "MyString"
    ))
  end

  it "renders new hotel form" do
    render

    assert_select "form[action=?][method=?]", hotels_path, "post" do

      assert_select "input[name=?]", "hotel[name]"
    end
  end
end
