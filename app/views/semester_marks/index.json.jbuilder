json.array!(@semester_marks) do |semester_mark|
  json.extract! semester_mark, :id, :semester, :gpa, :pass_year
  json.url semester_mark_url(semester_mark, format: :json)
end
