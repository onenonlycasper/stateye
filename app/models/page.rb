class Page < ActiveRecord::Base
  has_many :raw, :dependent => :destroy
end
