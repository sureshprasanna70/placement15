json.array!(@courses) do |course|
  json.extract! course, :id, :degree, :branch
  json.url course_url(course, format: :json)
end
