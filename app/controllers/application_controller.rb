class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # 必须在 authenticate_admin! 认证之前存储 "访问历史",因为存储行为会打乱正常的跳转流程，防止认证错误
  before_action :store_admin_location!, if: :storable_location?
  before_action :authenticate_admin!

  protected

    def after_sign_in_path_for(resource)
      (current_admin ? stored_location_for(resource) : rails_admin_path) || super
    end

    def after_sign_out_path_for(resource)
      stored_location_for(resource) || super
    end

    def configure_permitted_parameters
      attrs = [:account, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit(:sign_up, keys: attrs)
      devise_parameter_sanitizer.permit(:sign_in, keys: attrs)
      devise_parameter_sanitizer.permit(:account_update, keys: attrs)
    end

  private

    # 在下列情况时判断所访问的 URL 是否可存储是非常重要的：
    # - 该请求不是 GET 方法 (non idempotent)
    # - 该请求由 Devise 控制器（如Devise :: SessionsController）处理，可能导致无限重定向循环
    # - 该请求是一个 Ajax 请求，可能会导致非常意外的行为
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end

    def store_admin_location!
      store_location_for(:admin, request.fullpath)
    end
end
