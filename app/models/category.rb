class Category < ActiveRecord::Base
  has_many :articles

  validates :name, uniqueness: {case_sensitive: false}
end
