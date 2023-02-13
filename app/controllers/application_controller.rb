class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  #nameカラムログイン時追加の都合上、記述 ほかsession newにも追記アリ 入力フォームname
end
