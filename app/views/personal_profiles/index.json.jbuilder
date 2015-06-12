json.array!(@personal_profiles) do |personal_profile|
  json.extract! personal_profile, :id, :gender, :dob, :age, :height, :weight, :guardian_name, :guardian_occupation, :nationality, :mother_tongue
  json.url personal_profile_url(personal_profile, format: :json)
end
