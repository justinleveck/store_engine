require 'spec_helper'

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
end
