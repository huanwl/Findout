module HomeHelper
  def get_result_msg(is_pass)
    if is_pass == "true"
      "恭喜你答對了！"
    else
      "抱歉你答錯了！"
    end
  end
end
