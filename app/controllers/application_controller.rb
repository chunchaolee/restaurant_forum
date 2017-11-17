class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  private

  # authenticate_admin method
  def authenticate_admin

    # 使用了user class 中 .admin?的instance method
    unless current_user.admin?
      flash[:alert] = "NOT ALLOW!!"
      redirect_to root_path
    end
  end

end
