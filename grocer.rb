require 'pry'

	items =     [
      {:item => "KALE", :price => 3.00, :clearance => false},
      {:item => "AVOCADO", :price => 3.00, :clearance => true},
      {:item => "AVOCADO", :price => 3.00, :clearance => true},
      {:item => "AVOCADO", :price => 3.00, :clearance => true},
      
      
      {:item => "TEMPEH", :price => 3.00, :clearance => true},
      
      {:item => "CHEESE", :price => 6.50, :clearance => false},
      {:item => "BEER", :price => 13.00, :clearance => false},
      {:item => "CHEESE", :price => 6.50, :clearance => false},
      {:item => "CHEESE", :price => 6.50, :clearance => false}
    ]
	
	coupons = 	[
		{:item => "AVOCADO", :num => 2, :cost => 5.00},
		{:item => "BEER", :num => 2, :cost => 20.00},
		{:item => "CHEESE", :num => 3, :cost => 15.00}
	]


def find_item_by_name_in_collection(name, collection)
  i = 0
  while i < collection.length do
    if collection[i][:item] == name
      return collection[i]
    end
    i += 1
  end
  nil
end

def consolidate_cart(cart)
  i = 0
  new_cart = []
  while i < cart.length do
    new_cart_item = find_item_by_name_in_collection(cart[i][:item], new_cart)
    if new_cart_item
      new_cart_item[:count] += 1
    else
      new_cart_item = {
        :item => cart[i][:item],
        :price => cart[i][:price],
        :clearance => cart[i][:clearance],
        :count => 1
      }
      new_cart << new_cart_item
    end
    i += 1
  end
 new_cart
end

# consolidate_cart(items)

def apply_coupons(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  i = 0
  result = []
  while i < consolidated_cart.length do
    item = consolidated_cart[i]
    item_name = item[:item]
    item_count = item[:count]
    
    if !find_item_by_name_in_collection(item_name, coupons)                                     
      result << item
    else
      coupon_data = find_item_by_name_in_collection(item_name, coupons)
      coupon_num = coupon_data[:num]
      
      if item_count >= coupon_num
        coupon_num = coupon_data[:num]
        remainder_item = {}
        discounted_item = {}
        
        remainder = item_count % coupon_num
        
        remainder_item[:item] = item[:item]
        remainder_item[:price] = item[:price]
        remainder_item[:clearance] = item[:clearance]
        remainder_item[:count] = remainder
        result << remainder_item
        
        discounted_item[:item] = "#{item[:item]} W/COUPON"
        discounted_item[:price] = coupon_data[:cost] / coupon_num
        discounted_item[:clearance] = item[:clearance]
        discounted_item[:count] = coupon_num
        result << discounted_item
      else
        result << item
      end
    end
    # binding.pry
    i +=1
  end
  result
end

# apply_coupons(items, coupons)

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
