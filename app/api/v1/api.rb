class V1::API < Grape::API
  version :v1, using: :path
  logger.level = Logger::INFO

  helpers do
    params :pagination do
      optional :page, type: Integer
      optional :per_page, type: Integer
    end

    def logger
      API.logger
    end
  end

  desc 'Test api version'
  params do
    use :pagination # aliases: includes, use_scope
  end
  get :debug do
    'This is version 1 api'
  end
end
