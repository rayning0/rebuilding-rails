class QuotesController < Rulers::Controller
  def a_quote
    # "There is nothing either good or bad but thinking makes it so." +
    # "\n<pre>\n#{env}\n</pre>"
    req = Rack::Request.new(env)
    # @cont = env['PATH_INFO'].split('/')[1]
    @cont = req.path_info.split('/')[1]
    # @user_agent = env["HTTP_USER_AGENT"]
    @user_agent = req.user_agent
    @gem_version = Rulers::VERSION

    render :a_quote, { noun: :winking, cont: @cont,
      user_agent: @user_agent, time: Time.now, gem_version: @gem_version }
  end

  def exception
    raise "Just raised exception!"
  end
end