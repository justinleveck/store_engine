require 'spec_helper'
include Sorcery::TestHelpers::Rails

describe Product do
  it "is valid with a title, description, and price" do
    product = Product.new(
      title: 'Test',
      description: 'Test description',
      price: '1.99')
    expect(product).to be_valid
  end
  it "is invalid without a title" do
    expect(Product.new(title: nil)).to have(1).errors_on(:title)
  end
  it "is invalid without a description" do
    expect(Product.new(description: nil)).to have(1).errors_on(:description)
  end
  it "is invalid with a duplicate title" do
    Product.create(
      title: 'Test', description: 'Test description', price: '1.99')
    product = Product.new(
      title: 'Test',
      description: 'Test description',
      price: '1.99')
    expect(product).to have(1).errors_on(:title)
  end
  it "is valid when price is a valid decimal numeric value" do
    product = Product.new(
      title: 'Test',
      description: 'Test description',
      price: '1.99')
    expect(product).to be_valid
  end
  it "is invalid when price is an invalid decimal numeric value" do
    product = Product.new(
      title: 'Test',
      description: 'Test description',
      price: '1.9')
    expect(product).to have(1).errors_on(:price)
  end  
  it "is invalid when price is less than 0" do
    product = Product.new(
      title: 'Test',
      description: 'Test description',
      price: '-1.99')
    expect(product).to have(1).errors_on(:price)
  end
end
