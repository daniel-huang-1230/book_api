Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api' do
    scope '/v1' do
      scope '/publishers' do
        # endpoint 1  #show

      end
      scope '/shops' do
        # endpoint 2
      end
    end
  end
end
