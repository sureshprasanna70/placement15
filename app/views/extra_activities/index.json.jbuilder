json.array!(@extra_activities) do |extra_activity|
  json.extract! extra_activity, :id, :area_of_interest, :extra_curricular, :hobby, :responsibilty
  json.url extra_activity_url(extra_activity, format: :json)
end
