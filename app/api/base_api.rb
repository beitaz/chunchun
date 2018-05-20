class BaseAPI < Grape::API
  prefix :api

  get :debug do
    'This is BaseAPI#debug method'
  end

  mount V1::API
  mount V2::API
end
