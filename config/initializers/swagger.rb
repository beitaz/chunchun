# 若指定 API 挂载路径,或使用 prefix 选项设置 API 前缀, swagger.options.url 必须使用相同配置( "/api" )
GrapeSwaggerRails.options.url      = '/api/swagger_doc.json'
GrapeSwaggerRails.options.app_url  = 'http://localhost:3000'

# GrapeSwaggerRails.options.before_action do
#   GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
# end

GrapeSwaggerRails.options.app_name = 'Swagger'

# Authentications
GrapeSwaggerRails.options.api_auth     = 'Bearer' # Or 'bearer' for OAuth
GrapeSwaggerRails.options.api_key_name = 'Authorization'
GrapeSwaggerRails.options.api_key_type = 'header'

