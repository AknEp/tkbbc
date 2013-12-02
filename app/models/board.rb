class Board < ActiveRecord::Base
  TITLE_MAX_LEN = 100
  validates :title, :length => {:minimum=>1, :maximum=>TITLE_MAX_LEN}
end
