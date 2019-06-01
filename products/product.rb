require "ostruct"
require_relative "./product_importer"

module Products
  class Product
    include ProductImporter
    
    attr_accessor :product_collection
    
    def initialize
      @product_collection = []
    end
    
    def show
      puts @product_collection
    end
    
    def create_products product_info
      @product_collection = product_info.map do |product|
        OpenStruct.new(uuid: product['uuid'], name: product['name'], price: product['price'])
      end
    end
    
    def import(file_path)
      products_info = read_products_from_json(file_path)
      create_products products_info if !products_info.empty?
    end
    
    def available?
      @product_collection.count.positive?
    end
  end
end
