require 'rails_helper'

RSpec.describe "hotels/index", type: :view do
  before(:each) do
    assign(:hotels, [
      Hotel.create!(
        :name => "name"
      ),
      Hotel.create!(
        :name => "name"
      )
    ])
  end

  it "renders a list of hotels" do
    render
    assert_select "tr>td", :text => "name".to_s, :count => 2
  end
end
