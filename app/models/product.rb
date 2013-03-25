class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title

  validates_presence_of :description
  validates_presence_of :title
  validates_uniqueness_of :title
  validates :price, 
            :format => { :with => /^\d+??(?:\.\d{2,2})?$/ }
end
