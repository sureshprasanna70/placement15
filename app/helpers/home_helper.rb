module HomeHelper
  def prev_month_link
    ->(param, date_range) { link_to(raw("&laquo;"), {param => date_range.first - 1.day},:class=>"cal-link") }
  end
  def next_month_link
    ->(param, date_range) { link_to(raw("&raquo;"), {param => date_range.last + 1.day})}
  end
  def splitter(string)
    return string.split(",")
  end
  def redder(value)
    if value.blank?  || value.nil? 
      "<p class='danger'>Nil</p>".html_safe
    elsif value==0.0 || value==0 || value=="0.0" || value=="0"
      "<p>Not applicable to me</p>".html_safe
    else
      "#{h value}".html_safe 
    end
  end
end
