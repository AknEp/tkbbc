# encoding: utf-8

require 'spec_helper'

describe Post do
  describe "#create" do
    let(:too_long_string) {'a'*(Post::BODY_MAX_LEN + 1)}

    it "should have body text" do
      Post.create(body: 'hoge')
      expect(Post.find(1).body.present?).to be_true
    end

    it "should not be valid with body(more than #{Post::BODY_MAX_LEN} characters)" do
      @post = Post.new(body: too_long_string)
      expect(@post).not_to be_valid
    end
  end
end
