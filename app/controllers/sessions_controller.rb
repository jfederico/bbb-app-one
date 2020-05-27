class SessionsController < ApplicationController

  def launch
    puts ">>>>>>>>>>>>>>> session:launch"
    redirect_to omniauth_authorize_url(:bbbltibroker)
    puts params.to_json
  end

  def create
    puts ">>>>>>>>>>>>>>> session:create"
    auth = request.env["omniauth.auth"]
    puts auth.inspect
    if !auth.empty?
      puts "correct"
      #session[:uid] = auth.uid
      #query = JSON.parse(cookies['launch_params']).to_query
      #cookies.delete('launch_params')
    else
      puts "wrong"
    end
    redirect_to articles_url
  end

  def failure
    puts ">>>>>>>>>>>>>>> session:failure"
  end

  private

  def omniauth_authorize_path(provider)
    puts 'helper omniauth_authorize_path...'
    path = omniauth_callback_path(provider)
    path.slice(0..(path.index('/callback') - 1))
  end

  def omniauth_authorize_url(provider)
    puts 'helper omniauth_authorize_url...'
    url = omniauth_callback_url(provider)
    url.slice(0..(url.index('/callback') - 1))
  end

end
