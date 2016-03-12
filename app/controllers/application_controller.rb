class ApplicationController < ActionController::Base
 # Prevent CSRF attacks by raising an exception.
 # For APIs, you may want to use :null_session instead.
 protect_from_forgery with: :exception

 helper_method :current_user, :authenticate_user, :user_signed_in?, :mailbox, :conversation, :recipients_options


 def authenticate_user
   return true if current_user
   redirect_to login_path

   return false
   flash[:danger] = "Please log in."
 end

 def user_signed_in?
      !current_user.nil?
 end





 # def recipients_options(chosen_recipient = nil)
 #   s = ''
 #   User.all.each do |user|
 #     s << "<option value='#{user.id}' #{'selected' if user == chosen_recipient}>#{user.username}</option>"
 #   end
 #   s.html_safe
 # end


 # def recipients_options(chosen_recipient = nil)
 #   s = ''
 #
 #   s << "<option value='#{@chosen_recipient.id}'>#{@chosen_recipient.username}</option>"
 #
 #   s.html_safe
 # end




 private

 def current_user
   @current_user ||= User.find_by(id: session[:user_id])
 end


 def mailbox
   @mailbox ||= current_user.mailbox
 end

 def conversation
   @conversation ||= mailbox.conversations.find(params[:id])
 end
 end
