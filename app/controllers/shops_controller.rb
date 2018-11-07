class ShopsController < ApplicationController
  before_action :set_shop, only: [:update_as_sold]
  #  mark one or multiple copies of a book as sold in a specific shop
  def update_as_sold
    # request payload example
    # { "copies_sold" : 5 }
    books_in_stock = @shop.distributions.find_by(:book_id => shop_params[:book_id])
    copies_sold = shop_params[:copies_sold].try(:to_i)
    if books_in_stock.nil?
      render status: 404, json: {
        message: "Record not found - cannot find the book in this shop",
      }
    elsif copies_sold.nil? || copies_sold < 0
      render status: 422, json: {
        message: "Failed request due to invalid paylod data",
      }
    else
      # 1. decrement copies_in_stock
      actual_sold = books_in_stock.update_copies_in_stock copies_sold
      # 2. increment total books_sold_count of the shop
      books_in_stock.shop.update_sold_count actual_sold
      render status: 200, json: {
        message: "Successfully updated the books sold in the shop",
        shop: @shop
      }
    end
  end


  private
  def shop_params
    params.permit(:id, :book_id, :copies_sold)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
