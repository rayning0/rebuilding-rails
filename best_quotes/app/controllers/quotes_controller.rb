class QuotesController < Rulers::Controller
  def a_quote
    # "There is nothing either good or bad but thinking makes it so." +
    # "\n<pre>\n#{env}\n</pre>"

    render :a_quote, noun: :winking
  end

  def exception
    raise "Just raised exception!"
  end
end