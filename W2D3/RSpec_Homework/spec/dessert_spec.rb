require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.

To set up the environment, under Terminal:
touch Gemfile

=end

describe Dessert do
  subject(:croissant) { Dessert.new("croissant", 12, chef) }
  let(:chef) { double("Jane") }

  describe "#initialize" do
    it "sets a type" do
      expect(croissant.type).to eq("croissant")
    end

    it "sets a quantity" do
      expect(croissant.quantity).to eq(12)
    end

    it "starts ingredients as an empty array" do
      expect(croissant.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("ice cream", "wrong", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      croissant.add_ingredient("egg")
      arr = croissant.ingredients
      expect(arr).to eq(["egg"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients_list = ["milk", "egg", "sugar", "butter", "love"]
      5.times do |idx|
        croissant.ingredients << ingredients_list[idx]
      end
      ingredients_before_mix = croissant.ingredients
      croissant.mix!
      ingredients_after_mix = croissant.ingredients
      expect(ingredients_after_mix).to_not eq(ingredients_before_mix)
      expect(ingredients_after_mix.sort).to eq(ingredients_before_mix.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity"

    it "raises an error if the amount is greater than the quantity"
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
