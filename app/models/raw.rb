class Raw < ActiveRecord::Base
  belongs_to :page
  belongs_to :grep
end
