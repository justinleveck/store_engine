require 'spec_helper'
include Sorcery::TestHelpers::Rails

# A product must have a title, description, and price.
# The title and description cannot be empty strings.
# The title must be unique for all products in the system
# The price must be a valid decimal numeric value and greater than zero
# The photo is optional. If present it must be a valid URL format.

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
    pending
  end
  it "is invalid when price is less than 0" do
    product = Product.new(
      title: 'Test',
      description: 'Test description',
      price: '-5')
    expect(product).to have(1).errors_on(:price)
  end
end
