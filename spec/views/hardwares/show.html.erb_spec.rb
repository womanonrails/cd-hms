require 'rails_helper'

RSpec.describe "hardwares/show", type: :view do
  before(:each) do
    @hardware = assign(:hardware, Hardware.create!(
      :name => "Name",
      :length => 1.5,
      :width => 1.5,
      :height => 1.5,
      :weight => 1.5,
      :serial_number => "Serial Number",
      :price => 1.5,
      :state => 1,
      :note => "MyText"
    ).decorate)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Serial Number/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
