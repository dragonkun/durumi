class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
	before_filter :check_xhr?, :only => [:login_check, :email_check, :password_check]
  skip_before_filter :has_admin_user, :only => [:new, :create, :check_xhr?, :login_check, :email_check, :password_check]

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "Signup complete! Please sign in to continue."
      redirect_to '/login'
    when params[:activation_code].blank?
      flash[:error] = "The activation code was missing.  Please follow the URL from your email."
      redirect_back_or_default('/')
    else 
      flash[:error]  = "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_back_or_default('/')
    end
  end

	def login_check
		result_message = ''

		user_login = params[:user_login]

		# 형식 검사
		result_message += '<p class="error">ID 의 첫 글자는 영문자 혹은 언더스코어(_)로 시작해야 합니다.</p>' if user_login !~ /^[a-zA-Z_]+/
		result_message += '<p class="error">ID는 특수문자를 포함할 수 없습니다.</p>' if user_login =~ /[^\w^_]/

		# 길이 검사
		result_message += '<p class="error">ID는 4~12자만 가능합니다.</p>' if user_login.length < 4 or user_login.length > 12  

		# 중복 검사
		result_message += '<p class="error">이미 사용중인 ID 입니다.</p>' if User.count(:all, :conditions => ['login = ?', user_login]) > 0
		result_message = '<p class="success">사용가능한 ID입니다.</p>' if result_message == ''

		render :text => result_message
	end

	def email_check
		result_message = ''

		user_email = params[:user_email]

		email_name_regex  = '[\w\.%\+\-]+'.freeze
		domain_head_regex = '(?:[A-Z0-9\-]+\.)+'.freeze
		domain_tld_regex  = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'.freeze
		email_regex       = /\A#{email_name_regex}@#{domain_head_regex}#{domain_tld_regex}\z/i

		# 형식 검사
		result_message += '<p class="error">잘못된 형식의 E-mail 입니다.</p>' unless user_email =~ email_regex

		# 길이 검사
		result_message += '<p class="error">E-mail은 6~100자만 가능합니다.</p>' if user_email.length < 6 or user_email.length > 100  

		# 중복 검사
		result_message += '<p class="error">이미 사용중인 E-mail 입니다.</p>' if User.count(:all, :conditions => ['email = ?', user_email]) > 0 

		result_message = '<p class="success">사용가능한 E-mail 입니다.</p>' if result_message == ''

		render :text => result_message
	end

	def password_check
		result_message = ''

		user_password = params[:user_password]
		user_password_confirmation = params[:user_password_confirmation]

		# confirmation 검사
		result_message += '<p class="error">패스워드가 일치하지 않습니다.</p>' if user_password != user_password_confirmation

		# 길이 검사
		result_message += '<p class="error">패스워드는 최소 6자 이상이어야 합니다.</p>' if user_password.length < 6  

		result_message = '<p class="success">사용가능한 패스워드 입니다.</p>' if result_message == ''

		render :text => result_message
	end

	def check_xhr?
		unless request.xhr?
			result_message = '잘못된 요청입니다.'
			render :text => result_message
			return false;
		end

		return true;
	end
end
