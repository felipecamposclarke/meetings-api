json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :title, :title, :author, :date
  json.url meeting_url(meeting, format: :json)
end
