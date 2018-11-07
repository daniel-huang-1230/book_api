class PublishersController < ApplicationController
  before_action :set_publisher, only: [:retrieve_shops]
  # GET /publishers/:id
  # return the list of shops selling at least one book of that publisher



 # In the case where the AR is not found;
 # We would handle the exceptions in Concern

  def retrieve_shops
    book_ids = @publisher.books.pluck(:id)
    @shops = Shop.selling_books(book_ids)
    if @shops.nil?
      render status: 404, json: {
        message: "Record not found - cannot find the particular shop that sells books from this publisher",
      }
    else
      render status: 200, json: @shops
    end
  end


  private

  def publisher_params
    # whitelist params if needed in the future
    params.permit()
  end

  def set_publisher
    @publisher = Publisher.find(params[:id])
  end


end
