# frozen_string_literal: true

# CLI presentation helper
module InfoPresenter
  def present_product_info(products)
    puts 'Products Available:'
    products.each_with_index do |product, i|
      puts "#{i + 1}. #{product.name} (#{product.uuid}) - $#{product.price}"
    end
  end

  def present_shoppingcart(line_items, order_sum)
    puts 'Products in Shopping Cart:'
    puts '           N/A       ' if line_items.count.zero?
    line_items.each_with_index do |item, i|
      puts "#{i + 1}. #{item.name} (#{item.uuid}) - $#{item.price}"
    end
    puts ''
    if order_sum.promotion_applicable
      puts "Discount applied: #{order_sum.discount}% off on #{order_sum.promotion_name}"
    else
      puts 'Discount not applicable'
    end
    puts ''
    puts "Total:  $#{order_sum.total_cost}"
  end

  def present_helper
    puts '------------------------------------------------------------------'
    puts 'show products     - list all products available'
    puts 'import            - import products from /data, must be json file'
    puts '                  example: import products.json'
    puts 'add item          - add single item to ShoppingCart by uuid'
    puts '                  example: add item 1411 '
    puts 'show shoppingcart - show items and total cost of the ShoppingCart'
    puts 'exit              -   exit CLI'
    puts '------------------------------------------------------------------'
  end

  def present_init
    puts 'Checkout Your Shopping Cart!'
    puts 'Start with import some new products!'
    puts 'type help to list all commands available.'
  end

end
