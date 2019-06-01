require 'json'

module Products
  module ProductImporter
    
    def read_products_from_json file_path
      begin
        json_from_file = File.read(file_path)
        hash = JSON.parse(json_from_file)
      rescue => e
        puts 'can not open file, please try again'
        puts "error: #{e.message}"
        return []
      end
    end
    
  end  
end
