require 'ostruct'
require_relative './promotion'

module Orders
  class Order
    
    attr_accessor :line_items, :order_sum
    
    def initialize
      @line_items = []
      @order_sum = OpenStruct.new(
        order_num: 0,
        total_cost: '00.00',
        total_item: 0,
        promotion_applicable: false,
        promotion_name: 'N/A',
        discount: 0
      )
      @promotion = Orders::Promotion.new
    end
    
    def update_order_cost
      if @promotion.applicable?(@line_items)
        promotion_rule = @promotion.retrieve_rule(@line_items)
        @order_sum.total_cost = calculate_total_cost promotion_rule.discount
        @order_sum.promotion_applicable = true
        @order_sum.promotion_name = promotion_rule.name
        @order_sum.discount = promotion_rule.discount
      else
        @order_sum.total_cost = calculate_total_cost
        @order_sum.promotion_applicable = false
        @order_sum.promotion_name = 'N/A'
        @order_sum.discount = 0
      end
    end
    
    def calculate_total_cost(discount = 0)
      percent = (100 - discount.to_i).to_f / 100
      cost = @line_items.inject(0.0) { |sum, i| sum + i.price.to_f } * percent
      sprintf('%.2f', cost)
    end
    
    def add_single_item(product_id, products)
      if (product=product_exist?(products, product_id))
        @line_items << product
        @order_sum.total_item += 1
        @order_sum.order_num = rand(1000..1100)
        update_order_cost
        puts 'item is sucessefuly added.'
      else
        puts 'invalid product uuid, please try again.'
      end
    end
    
    def product_exist?(products, product_id)  
      products.find { |product| product.uuid == product_id.to_i }
    end
    
  end
end
