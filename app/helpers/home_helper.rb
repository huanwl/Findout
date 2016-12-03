module HomeHelper
  def get_result_msg(is_pass)
    if is_pass == "true"
      "恭喜你答對了！"
    else
      "抱歉你答錯了！"
    end
  end

  def get_tip(level_id)
    level = Level.find(level_id)
    tips = level.tips
    count = tips.count
    if count == 0
      "抱歉！ 本題尚無任何提示"
    else
      prng = Random.new
      index = prng.rand(count)
      "小提示： " + tips[index].name
    end
  end
end
