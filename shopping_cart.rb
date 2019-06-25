require './my_shoppingcart'

module MyShopppingCart
  class ShoppingCart
    def initialize
      @product = Products::Product.new
      @order = Orders::Order.new
    end
    
    def import_products(input_str)
      @product.import(input_str)
    end

    def show_products
      @product.product_collection
    end

    def products_available?
      @product.available?
    end

    def add_item(product_id)
      @order.add_single_item(product_id, @product.product_collection)
    end

    def line_items
      @order.line_items
    end

    def order_sum
      @order.order_sum
    end
    
    def clear_up_order
      @order = Orders::Order.new
    end
  end
end
