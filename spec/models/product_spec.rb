require 'rails_helper'


  RSpec.describe Product, type: :model do
    describe 'Validations' do
      it 'should pass with the necessary information' do
        category = Category.create({:name => 'tree'})
        product = Product.create!( {:name => 'tree',
        :description => 'big tree',
        :category_id => category.id,
        :quantity => 10,
        :image => 'img.com',
        :price => 50})
        expect(product).to be_a Product
      end
      it "shouldn't pass without name" do
        category = Category.create({:name => nil})
        expect { Product.create!({:name => nil,
        :description => 'big tree',
        :category_id => category.id,
        :quantity => 10,
        :image => 'img.com',
        :price => 50})}.to raise_error(/Name can't be blank/)
      end

      it "shouldn't pass without price" do
       category = Category.create({:name => 'tree'})
       expect { Product.create!( {:name => 'tree',
        :description => 'big tree',
        :category_id => category.id,
        :quantity => 10,
        :image => 'img.com',
        :price_cents => nil})}.to raise_error(/Price can't be blank/)

      end
      it "shouldn't pass without the quantity" do
        category = Category.create({:name => 'tree'})
       expect { Product.create!({:name => 'tree',
        :description => 'big tree',
        :category_id => category.id,
        :quantity => nil,
        :image => 'img.com',
        :price => 50})}.to raise_error(/Quantity can't be blank/)
      end
      it "shouldn't pass without the category_id" do
       category = Category.create({:name => 'tree'})
       expect { Product.create!({:name => 'tree',
        :description => 'big tree',
        :category_id => nil,
        :quantity => 50,
        :image => 'img.com',
        :price => 50})}.to raise_error(/Category can't be blank/)
      end
    end
  end
