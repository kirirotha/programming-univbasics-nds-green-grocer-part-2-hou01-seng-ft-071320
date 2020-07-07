require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  new_cart=cart
  coupons.each do |coupon_item|
    cart.each do |cart_item|
      if cart_item[:item] == coupon_item[:item]
        cart_item[:count] = cart_item[:count] - coupon_item[:num]
        discounted_price = coupon_item[:cost] / coupon_item[:num]
        discounted_item = {:item => cart_item[:item] + ' W/COUPON', :price => discounted_price, :clearance => cart_item[:clearance], :count => coupon_item[:num]}
        new_cart << discounted_item

      
      end  
    end  
  end
  return new_cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  new_cart = []
  cart.each do |cart_item|
    if cart_item[:clearance] == true
      cart_item[:price] = cart_item[:price] * (0.8)
    end
    new_cart << cart_item
  end
  return new_cart
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
  puts cart
  consolidated_cart = consolidate_cart(cart)
  puts cart
  puts consolidated_cart
  applied_coupons_to_cart = apply_coupons(consolidated_cart, coupons)
  puts cart
  puts applied_coupons_to_cart
  final_cart = apply_clearance(applied_coupons_to_cart)
  puts cart
  puts final_cart

end
unconsolidated_cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true, :count => 2},
  {:item => "AVOCADO", :price => 3.00, :clearance => true, :count => 2},
  {:item => "KALE",    :price => 3.00, :clearance => false, :count => 3}]

cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true, :count => 4},
  {:item => "KALE",    :price => 3.00, :clearance => false, :count => 3}]
coupon = [
  {:item => "AVOCADO", :num => 2, :cost => 5.00},
  {:item => "KALE",    :num => 1, :cost => 1.22}
  
  
  ]

#consolidate_cart(unconsolidated_cart)
#apply_coupons(cart, coupon)
#apply_clearance(cart)
checkout(unconsolidated_cart, coupon)


