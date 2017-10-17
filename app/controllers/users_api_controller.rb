class UsersApiController < BaseApiController
  skip_before_action :verify_authenticity_token
  def index
    render json: User.all
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.find_by_email(email)
    result = {}
    if user && user.authenticate(password)
      result['success'] = true;
      result['user'] = user
    else
      result['success'] = false;
      result['msg'] = "User name and password are invalid."
    end
    render json: result
  end

  def signup
    email = params[:email]
    password = params[:password]
    user = User.find_by_email(email)
    result = {}
    if user && user.authenticate(password)
      result['success'] = true;
      result['user'] = user
    else
      result['success'] = false;
      result['msg'] = "User name and password are invalid."
    end
    render json: result
  end
end
