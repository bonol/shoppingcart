require './my_shoppingcart'

describe Orders::Order do
  
  let(:products) { Products::Product.new.import('./test_data/products.json') }
  let(:item1) { products.first }
  
  subject { Orders::Order.new }
  
  context 'product' do
    it "not exist" do
      expect(subject.product_exist?(products, 1000000001)).to be_falsy
    end
    it "exist" do
      subject.add_single_item(item1.uuid, products)
      expect(subject.product_exist?(products, item1.uuid)).to be item1
    end
  end
  
  context "order" do
    it "has one new item without discount" do
      subject.add_single_item(item1.uuid, products)
      expect(subject.line_items.count).to eql 1 
      expect(subject.order_sum.discount).to eql 0 
    end

    it "has 10% discount" do
      subject.add_single_item(products.last.uuid, products) 
      expect(subject.order_sum.discount).to eql 10
      expect(subject.order_sum.total_cost).to eql '28.10'
    end

    it "has 15% discount" do
      subject.add_single_item(products[1].uuid, products) 
      expect(subject.order_sum.discount).to eql 15
      expect(subject.order_sum.total_cost).to eql '56.06'
    end    
        
    it "has 4 items with 20% discount" do
      products.each{|product| subject.add_single_item(product.uuid, products)}
      expect(subject.line_items.count).to eql 4
      expect(subject.order_sum.discount).to eql 20
      expect(subject.order_sum.total_cost).to eql '163.65'
    end
    
  end
  
  

end
