class ApiController < ActionController::API
  include Knock::Authenticable
  include Pundit

  before_action :authenticate_user
  before_action :skip_session
  before_action :set_default_format
  # JWT: Knock defines it's own current_user method unless one is already
  # defined. As controller class is cached between requests, this method
  # stays and interferes with a browser-originated requests which rely on
  # Devise's implementation of current_user. As we define the method here,
  # Knock does not reimplement it anymore but we have to do its thing
  # manually.
  def current_user
    if token
      @_current_user ||= begin
			   Knock::AuthToken.new(token: token).entity_for(User)
			 rescue
			   nil
			 end
    else
      raise StandardError.new "User token is null"
      super
    end
  end

  private

  # JWT: No need to try and load session as there is none in an API request
  def skip_session
    request.session_options[:skip] = true if token
  end

  # JWT: overriding Knock's method to manually trigger Devise's auth.
  # When there is no token we assume the request comes from the browser so
  # has a session (potentially with warden key) attached.
  def authenticate_entity(entity_name)
    if token
      super(entity_name)
    else
      current_user
    end
  end

  private

  def set_default_format
    request.format = :json
  end
end
