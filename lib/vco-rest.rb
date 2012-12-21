require 'rest_client'

class Vco 
  def self.workflows
   return RestClient.get "http://vcoadmin:vcoadmin@192.168.75.145:8280/api/workflows"
  end

  def self.actions
   return RestClient.get "http://vcoadmin:vcoadmin@192.168.75.145:8280/api/workflows"
  end
end
