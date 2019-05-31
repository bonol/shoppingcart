require './my_shoppingcart'

describe Products::Product do
  
  subject { Products::Product.new }
  
  before { subject.import('./test_data/products.json') }
  
  it "import new products" do
    expect(subject.product_collection.count).to eql 4
  end
  
  it "check available" do
    expect(subject.available?).to be_truthy
  end
end
