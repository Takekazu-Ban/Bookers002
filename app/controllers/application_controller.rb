class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
		def configure_permitted_parameters
			# sign_up時、emailのデータの操作を許可（認証Keyをnameに変更してemailが反応しなっくなった為)
			devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
			# sign_in時、nameのデータの操作を許可
			devise_parameter_sanitizer.permit(:sign_in,keys:[:name])
		end

	# 下記は、指定のaction_contrillerでログインページに移行させてしまうので使用しない
	#before_action :authenticate_user!
		# ログイン後、表示ページを指定
		def after_sign_in_path_for(resource)
			user_path(current_user.id)
		end

		# ログアウト後、表示するページを指定
		def after_sign_out_path_for(resource)
			root_path
		end



end

