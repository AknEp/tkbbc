# encoding: utf-8

require 'spec_helper'

describe Board do
  let(:too_long_title) {'a'*(Board::TITLE_MAX_LEN + 1)}

  describe "#create" do
    before(:each) do
      @board = Board.new
    end

    it "should not valid without title" do
      expect(@board).not_to be_valid
    end

    it "should have title" do
      @board.title = 'hoge'
      expect(@board).to be_valid
    end

    it "should not be valid with title(more than #{Board::TITLE_MAX_LEN} characters)" do
      @board.title = too_long_title
      expect(@board).not_to be_valid
    end

  end

  describe "#update" do
    before(:each) do
      @board = Board.create(title: 'hoge')
    end

    it "should title equals to be fuga" do
      @board.title = 'fuga'
      @board.save

      expect(Board.find(1).title).to eq('fuga')
    end

    it "should not title equals to be fuga" do
      expect(Board.find(1).title).not_to eq('fuga')
    end

    it "should not be valid with too long title(more than #{Board::TITLE_MAX_LEN} characters)" do
      @board.title = too_long_title
      expect(@board).not_to be_valid
    end

  end


  describe "#destroy" do
    before(:each) do
      @board = Board.create(title: 'hoge')
    end

    it "should be decremented count when " do
      expect{@board.destroy}.to change{Board.count}.by(-1)
    end

  end

end
