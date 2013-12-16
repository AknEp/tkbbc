require 'spec_helper'

describe "boards/edit" do

  let(:title){ "some title" }

  before(:each) do
    @board = assign(:board, stub_model(Board, title: title ))
  end

  it "renders the edit board form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", board_path(@board), "post" do |form_elements|
      assert_select "input[name=?][value=?]", "board[title]", @board.title do |elements|
        elements.each do |element|
          form_elements.each do |form_element|
            assert_select form_element, "label[for=?]", element.attributes["id"]
          end
        end
      end
      assert_select "input[type=?]", :submit
      #assert_select "label[for=?]", "board_title"
    end
  end
end
