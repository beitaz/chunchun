class BaseAPI < Grape::API
  prefix :api
  format :json
  default_format :json

  rescue_from ArgumentError do |e|
    error!("ArgumentError: #{e.message}")
  end

  rescue_from NoMethodError do |e|
    error!("NoMethodError: #{e.message}")
  end
  rescue_from :all

  get :debug do
    'This is BaseAPI#debug method'
  end

  mount V1::API
  mount V2::API
end
