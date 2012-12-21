#vCenter Orchestrator client stubs

require 'rest_client'
require 'json'

server = "192.168.75.145"
user = "vcoadmin"
pass = "vcoadmin"

clientString = "http://#{user}:#{pass}@#{server}:8280/api/workflows"
p clientString

def getAllWfs(clientString)
 response = RestClient.get clientString
 return response
end

result = getAllWfs(clientString)
parsed = JSON.parse(result)

parsed["links"].each do |wf|
 wf.each { |x| x.each { |y|
   if y.kind_of?(Array) == true
    y.each { |a|
     #p a
     #p a.class
     #p a.keys
     #p a.values
     if a.values[0] == "itemHref"
      p a.values[1]
     end
     #p a.values.class
     #p a.index("itemHref")
    } end } } end


