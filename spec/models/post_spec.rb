# encoding: utf-8

require 'spec_helper'

describe Post do
  describe "#create" do
    let(:long_string_1001) {'a'*1001}

    it "should fill body text" do
      Post.create(body: 'hoge')
      expect(Post.find(1).body.present?).to be_true
    end

    it "should not be valid" do
      @post = Post.new(body: long_string_1001)
      expect(@post).not_to be_valid
    end
  end
end
