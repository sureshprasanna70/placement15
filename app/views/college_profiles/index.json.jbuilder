json.array!(@college_profiles) do |college_profile|
  json.extract! college_profile, :id, :level, :degree, :branch, :college, :semester, :cgpa
  json.url college_profile_url(college_profile, format: :json)
end
