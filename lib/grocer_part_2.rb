require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  new_cart=[]
  coupons.each do |coupon_item|
    cart.each do |cart_item|
      if cart_item[:item] == coupon_item[:item]
        #puts cart_item
        cart_item[:count] = cart_item[:count] - coupon_item[:num]
        #puts cart_item
        discounted_item_name = cart_item[:item] + " W/COUPON"
        discounted_price = coupon_item[:cost] / coupon_item[:num]
        discounted_item = {:item => discounted_item_name, :price => discounted_price, :clearence => true, :count => coupon_item[:num]}
        if cart_item[:count] > 0
          new_cart << cart_item
        end  
        new_cart << discounted_item
        #puts discounted_item
        #puts cart 
      
      else
        new_cart << cart_item
      end  
    end  
  end
  puts new_cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end

cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true, :count => 3},
  {:item => "KALE",    :price => 3.00, :clearance => false, :count => 1}]
coupon = [
  {:item => "AVOCADO", :num => 2, :cost => 5.00}
  ]

apply_coupons(cart, coupon)



