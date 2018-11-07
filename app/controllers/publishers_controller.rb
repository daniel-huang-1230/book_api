class PublishersController < ApplicationController
  before_action :set_publisher, only: [:retrieve_shops]
  # GET /publishers/:id
  # return the list of shops selling at least one book of that publisher


 # delegate the render method to a helper module
 # implemented in Concern, in the case where the AR is not found;
 # we also handle the exception in Concern

  def retrieve_shops
    book_ids = @publisher.books.pluck(:id)
    @shops = Shop.selling_books(book_ids)

    render json: @shops

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
