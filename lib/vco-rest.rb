require 'rest_client'

class VCO 
  def self.workflows(user, pass, server)
   return RestClient.get "http://#{user}:#{pass}@#{server}:8280/api/workflows"
  end

  def self.actions(user, pass, server)
   return RestClient.get "http://#{user}:#{pass}@#{server}:8280/api/actions"
  end
end
