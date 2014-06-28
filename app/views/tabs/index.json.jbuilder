json.array!(@tabs) do |tab|
  json.extract! tab, :id, :name, :tab_code, :pincode, :mac_address, :zone_id
  json.url tab_url(tab, format: :json)
end
