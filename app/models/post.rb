class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute| 
      if category_attribute.present?
        category = Category.find_or_create_by(category_attribute)
        #self.categories << category 
        #above line is inefficient because it returns all the categories
        if !self.categories.include?(category)
        self.post_categories.build(:category => category)
        #instantiating an instance of the join model 
        #which is already associated to the post and 
        #passing in the category
        end
      end 
    end 
  end 

end
