module SessionsHelper
  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.joins(:sessions).where('sessions.session_token' => session[:session_token]).first
  end

  def login_user!(user, password)
    @current_user = User.find_by_credentials(user, password)
    add_session!(@current_user) if @current_user
  end

  def logout_user!
    ses = Session.find_by_session_token(session[:session_token])
    ses.destroy
  end

  def require_cat_owner!(cat)
    redirect_to new_session_url unless current_user.id == cat.user_id
  end

  def add_session!(user)
    token = User.generate_session_token
    ses = Session.new({user_id: user.id, session_token: token})
    session[:session_token] = token
    ses.save!
  end
end