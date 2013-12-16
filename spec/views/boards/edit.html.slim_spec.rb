require 'spec_helper'

describe "boards/edit" do

  let(:title){ "some title" }
  let(:page) { Capybara::Node::Simple.new(rendered) }

  before(:each) do
    @board = assign(:board, stub_model(Board, title: title ))
    # TODO: ランダムで値を入れる手段はないだろうか？

    render
  end

  it "form exists" do
    page.find("form[action='#{board_path(@board)}'][method=post]" ) do |form|
      form.should have_selector("input[name='board[title]']", count: 1) do |title_input|
        title_input.first["value"].should eq(@board.title)
        form.should have_selector("label[for='#{title_input.first["id"]}']", count: 1)
      end
      form.should have_selector("input[type=submit]")
    end
  end

end
