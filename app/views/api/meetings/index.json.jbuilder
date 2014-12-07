json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :title, :description, :author, :date
end
