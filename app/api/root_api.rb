class RootAPI < Grape::API
  prefix :api
  format :json
  default_format :json

  rescue_from ArgumentError do |e|
    error!("ArgumentError: #{e.message}")
  end

  rescue_from NoMethodError do |e|
    error!("NoMethodError: #{e.message}")
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    error_response(message: e.message, status: 404)
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    error_response(message: e.message, status: 422)
  end

  rescue_from :all

  get :debug do
    'This is BaseAPI#debug method'
  end

  mount V1::API
  mount V2::API

  add_swagger_documentation
end
