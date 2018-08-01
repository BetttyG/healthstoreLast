class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
    @items = Item.all
  end
  
  def category
    catName = params[:title]
    @items = Item.where("category like ?" , catName)
  end

  def help
  end

  def about
  end

end
