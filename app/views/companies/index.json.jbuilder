json.array!(@companies) do |company|
  json.extract! company, :id, :name, :visting, :profile
  json.url company_url(company, format: :json)
end
