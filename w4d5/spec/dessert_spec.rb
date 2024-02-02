require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:brownie) {Dessert.new("brownie", 50, "chef")}
  let(:chef) { double("chef", :titleize => "Chef Chef the Great Baker") }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie", "a lot", "chef") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownie.add_ingredient("chocolate")
      expect(brownie.ingredients).to eq(["chocolate"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      brownie.add_ingredient("chocolate")
      brownie.add_ingredient("flour")
      brownie.add_ingredient("butter")
      brownie.mix!
      expect(brownie.ingredients).to be(brownie.ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      brownie.eat(3)
      expect(brownie.quantity).to eq(47)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat(75)}.to raise_error(StandardError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize)
      brownie.serve
    end
  end

  describe "#make_more" do
    let(:chef) {Chef.new("chef")}
    subject(:brownie) {Dessert.new("brownie", 50, chef)}
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end