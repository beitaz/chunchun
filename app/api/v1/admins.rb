class V1::Admins < Grape::API
  resource :admins do
    desc 'List'
    get do
      Admin.all
    end
  end
end
