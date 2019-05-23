class CategoriesController < ApplicationController
  def index
    @category = Category.all
    @category.sample(2)
  end
end
