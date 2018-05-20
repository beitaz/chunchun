class V1::API < Grape::API
  version :v1, using: :path

  desc 'Test api version'
  get :debug do
    'This is version 2 api'
  end
end
