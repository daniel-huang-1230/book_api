class ApplicationController < ActionController::API
  include ResponseParser
  include ExceptionHandler
end
