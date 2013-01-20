require 'rest_client'
require 'nokogiri'

class Workflow
  def initialize(itemHref, id, categoryName, canExecute, categoryHref, description, name, type, canEdit)
    @itemHref = itemHref
    @id = id
    @categoryName = categoryName
    @canExecute = canExecute
    @categoryHref = categoryHref
    @description = description
    @name = name
    @type = type
    @canEdit = canEdit
    p itemHref, id, categoryName, canExecute, categoryHref, description, name, type, canEdit
  end
end

class VCO 
  def self.schema(server)
   xml_data = RestClient.get( "http://#{server}:8280/api/schema", :content_type => 'application/xml', :accept => 'application/xml')
   reader = Nokogiri::XML::Reader(xml_data)
    reader.each do |node| p node.name
     if node.node_type == Nokogiri::XML::Reader::TYPE_ELEMENT
      p node.attributes()
     end
    end
  end

  def self.workflows(user, pass, server)
   xml_data = RestClient.get( "http://#{user}:#{pass}@#{server}:8280/api/workflows", :content_type => 'application/xml', :accept => 'application/xml')
   reader = Nokogiri::XML::Reader(xml_data)
    reader.each do |node|  
     if node.node_type == Nokogiri::XML::Reader::TYPE_ELEMENT
      p node.attributes
      end
    end
  end

  def self.actions(user, pass, server)
   xml_data = RestClient.get( "http://#{user}:#{pass}@#{server}:8280/api/actions", :content_type => 'application/xml', :accept => 'application/xml')
   reader = Nokogiri::XML::Reader(xml_data)
    reader.each do |node| p node.name
     if node.node_type == Nokogiri::XML::Reader::TYPE_ELEMENT
      p node.attributes()
     end
    end
  end

end
