class V1::API < Grape::API
  version :v1, using: :path
  logger.level = Logger::INFO

  helpers do
    def current_user
      Admin.find_by(auth_token: request.headers['Authorization'])
    end

    def authorized?
      error!('401 Unauthorized', 401) unless current_user
    end

    params :pagination do
      optional :page, type: Integer
      optional :per_page, type: Integer
    end

    def logger
      API.logger
    end
  end

  desc 'Test api version'
  # params do
  #   use :auth
  #   # use :pagination # aliases: includes, use_scope
  # end
  get :debug do
    authorized?
    'This is version 1 api'
  end

  mount Auth
  mount Admins
end
