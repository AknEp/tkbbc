# encoding: utf-8

class Post < ActiveRecord::Base
  BODY_MAX_LEN = 1000
  validates :body, length: {maximum: BODY_MAX_LEN}
end
