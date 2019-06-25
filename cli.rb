require 'readline'
require './my_shoppingcart'

module MyShopppingCart
  class CLI
    extend InfoPresenter

    def self.start
      present_init
      shoppingcart = ShoppingCart.new
      while buf = Readline.readline('> ', true)
        begin
          shoppingcart.import_products(file_path('import products.json'))
          case buf
          when /import\s/
            res = shoppingcart.import_products(file_path(buf))
            puts res.nil? ? 'Product import failed!' : 'Product import suceeded!'
          when 'show products'
            if shoppingcart.products_available?
              present_product_info shoppingcart.show_products
            else
              puts 'No product exist yet.'
            end
          when /add\sitem\s/
            if shoppingcart.products_available?
              shoppingcart.add_item(product_id(buf))
            else
              puts 'No product exit yet.'
            end
          when 'show shoppingcart'
            present_shoppingcart(shoppingcart.line_items, shoppingcart.order_sum)
          when 'clear shoppingcart'
            shoppingcart.clear_up_order
            puts 'ShoppingCart got clean up.'
          when 'help'
            present_helper
          when 'exit'
            puts 'Bye for now.'
            exit
          else
            puts 'Can not recognize your command, please try again!'
          end
        rescue => e
          puts 'rescue from error, please try again.'
          puts "error message: #{e.message}"
          next
        end
      end
    end

    def self.file_path(input_str)
      './data/' + input_str.split(' ').last
    end

    def self.product_id(input_str)
      input_str.split(' ').last
    end
  end
end

MyShopppingCart::CLI.start
