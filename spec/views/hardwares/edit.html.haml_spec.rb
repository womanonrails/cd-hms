require 'rails_helper'

RSpec.describe "hardwares/edit", type: :view do
  before(:each) do
    @hardware = assign(:hardware, Hardware.create!(
      :name => "MyString",
      :length => 1.5,
      :width => 1.5,
      :height => 1.5,
      :weight => 1.5,
      :serial_number => "MyString",
      :price => 1.5,
      :status => 1
    ))
  end

  it "renders the edit hardware form" do
    render

    assert_select "form[action=?][method=?]", hardware_path(@hardware), "post" do

      assert_select "input#hardware_name[name=?]", "hardware[name]"

      assert_select "input#hardware_length[name=?]", "hardware[length]"

      assert_select "input#hardware_width[name=?]", "hardware[width]"

      assert_select "input#hardware_height[name=?]", "hardware[height]"

      assert_select "input#hardware_weight[name=?]", "hardware[weight]"

      assert_select "input#hardware_serial_number[name=?]", "hardware[serial_number]"

      assert_select "input#hardware_price[name=?]", "hardware[price]"

      assert_select "input#hardware_status[name=?]", "hardware[status]"
    end
  end
end
