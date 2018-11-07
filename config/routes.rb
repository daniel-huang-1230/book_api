Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api' do
    scope '/v1' do
      scope '/publishers' do
        # endpoint 1 GET
        get '/:id' => 'publishers#retrieve_shops'
      end
      scope '/shops' do
        # endpoint 2 PATCH
        # I believe Rails treats PATCH as an alias of PUT, while they are
        # actually different HTTP methods
        patch '/:id/books/:book_id' => 'shops#update_as_sold'
      end
    end
  end
end
