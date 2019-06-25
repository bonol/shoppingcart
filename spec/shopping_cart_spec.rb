require './my_shoppingcart'

describe MyShopppingCart::ShoppingCart do
  
  let(:products) { subject.import_products('./test_data/products.json') }
  let(:item1) { products.first }
  
  before do
    subject.add_item(item1.uuid)
  end
  
  it "shoppingcart has one item" do
    expect(subject.line_items.count).to eql 1
  end
  
  it "clear shoppingcart" do
    subject.clear_up_order
    expect(subject.line_items.count).to eql 0
    expect(subject.order_sum.total_item).to eql 0
  end
  
end
