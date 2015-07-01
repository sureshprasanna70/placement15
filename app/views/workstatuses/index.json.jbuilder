json.array!(@workstatuses) do |workstatus|
  json.extract! workstatus, :id, :numrange, :workstatus
  json.url workstatus_url(workstatus, format: :json)
end
