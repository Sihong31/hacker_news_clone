module PostsHelper

  def my_time(datetime_obj)
    datetime_obj.strftime("%B %d, %Y")
  end

end
