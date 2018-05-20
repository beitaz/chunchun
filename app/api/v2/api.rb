class V2::API < Grape::API
  version :v2, using: :path

  desc 'Test api version'
  get :debug do
    'This is version 2 api'
  end
end
