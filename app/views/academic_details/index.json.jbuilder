json.array!(@academic_details) do |academic_detail|
  json.extract! academic_detail, :id, :course, :institution, :examination_authority, :pass_year, :percentage
  json.url academic_detail_url(academic_detail, format: :json)
end
