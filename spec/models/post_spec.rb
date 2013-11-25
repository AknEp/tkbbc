# encoding: utf-8

require 'spec_helper'

describe Post do
  let(:too_long_string) {'a'*(Post::BODY_MAX_LEN + 1)}

  describe "#create" do
    it "should have body text" do
      Post.create(body: 'hoge')
      expect(Post.find(1).body.present?).to be_true
    end

    it "should not be valid with body(more than #{Post::BODY_MAX_LEN} characters)" do
      @post = Post.new(body: too_long_string)
      expect(@post).not_to be_valid
    end
  end

  describe "#update" do
    before(:each) do
      @post = Post.create(body: 'hoge')
    end

    it "should body equals to be fuga" do
      @post.body = 'fuga'
      @post.save

      expect(Post.find(1).body).to eq('fuga')
    end

    it "should not body equals to be fuga" do
      expect(Post.find(1).body).not_to eq('fuga')
    end

    it "should not be valid with too long body(more than #{Post::BODY_MAX_LEN} characters)" do
      @post.body = too_long_string
      expect(@post).not_to be_valid
    end

  end
end
