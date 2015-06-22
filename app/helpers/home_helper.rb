module HomeHelper
  def prev_month_link
    ->(param, date_range) { link_to(raw("&laquo;"), {param => date_range.first - 1.day},:remote=>true,:class=>"cal-link") }
  end
  def next_month_link
    ->(param, date_range) { link_to(raw("&raquo;"), {param => date_range.last + 1.day},:remote=>true)}
  end
end
