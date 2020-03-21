class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
	def configure_permitted_parameters
		# sign_up時、nameのデータの操作を許可
		devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
		# sign_in時、nameのデータの操作を許可
		devise_parameter_sanitizer.permit(:sign_in,keys:[:name])
	end
end
