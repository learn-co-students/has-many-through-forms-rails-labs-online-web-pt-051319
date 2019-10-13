class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments


  def categories_attributes=(categories_attributes)
    # binding.pry
  	categories_attributes.values.each do |categories_attribute|
  		category = Category.find_or_create_by(categories_attribute)
  		self.categories << category unless self.categories.include?(category)
    # binding.pry
  	end
  end

end