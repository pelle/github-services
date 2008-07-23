service :timecert do |data, payload|
  Net::HTTP.start( "timecert.org") do |http|
    payload['commits'].each do |sha1,commit|
      http.get("/#{sha1}.time",{"Referer"=>commit["url"]})
    end
  end
end