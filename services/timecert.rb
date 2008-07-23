service :timecert do |data, payload|
  Net::HTTP.start( "timecert.org") do |http|
    payload['commits'].each do |commit|
      http.get("/#{commit["id"]}.time",{"Referer"=>commit["url"]})
    end
  end
end