json.array!(@projects) do |project|
  json.extract! project, :id, :title, :desc, :technology
  json.url project_url(project, format: :json)
end
