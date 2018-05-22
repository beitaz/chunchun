class V1::Auth < Grape::API
  namespace :login do
    desc 'Authentication'
    params do
      requires :email, type: String, desc: 'Email'
      requires :password, type: String, desc: 'Password'
    end
    post do
      admin = Admin.find_by(params.slice(:email))
      if admin&.valid_password?(params[:password])
        token = SecureRandom.hex(64)
        admin.update(auth_token: token)
        present token: token
      else
        error!({ msg: 'Authentication failure.' }, 404)
      end
    end
  end
end
