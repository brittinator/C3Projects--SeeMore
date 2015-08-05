class SessionsController
  def create
    auth_hash = request.env['omniauth.auth']
  end
end
