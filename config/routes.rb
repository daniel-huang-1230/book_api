Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api' do
    scope '/v1' do
      scope '/publishers' do
        # endpoint 1
        get '/:publisher-id' => 'publishers#retrieve_shops'
      end
      scope '/shops' do
        # endpoint 2
        put '/:shop-id/books' => 'shops#update_as_sold'
      end
    end
  end
end
