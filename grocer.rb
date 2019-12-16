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
  counter = 0
  while counter < coupons.length do
    
    # cart item in question if present, else nil
    cart_item = find_item_by_name_in_collection(coupons[counter][:item], cart) 
    
    # the string that will replace item name
    couponed_item_name = "#{coupons[counter][:item]} W/COUPON" 
    
    # checks if prev couponed items in cart, else nil
    cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart) 
    
    # if cart_item present AND cart_item count is >= to coupon num execute below
    if cart_item && cart_item[:count] >= coupons[counter][:num]
      # if couponed item is present in cart
      if cart_item_with_coupon
        # add coupon num to item count num
        cart_item_with_coupon[:count] += coupons[counter][:num]
        # subtract coupon num from item count num
        cart_item[:count] -= coupons[counter][:num]
        # if couponed item is NOT present in cart 
      else
        # create new cart_item_with_coupon with the following key/val pairs
        cart_item_with_coupon = {
          :item => couponed_item_name,
          :price => coupons[counter][:cost] / coupons[counter][:num],
          :clearance => cart_item[:clearance],
          :count => coupons[counter][:num]
        }
        # add it to the cart
        cart << cart_item_with_coupon
        # subtract from uncouponed item by whatever coupon num is
        cart_item[:count] -= coupons[counter][:num]
      end
    end
    counter += 1
  end
 cart
end

def apply_clearance(cart)
  i = 0
  while i < cart.length do
    if cart[i][:clearance]
      cart[i][:price] = (cart[i][:price] * 0.8).round(2)
    end
    i += 1
  end
  cart
end

def checkout(cart, coupons)
  # binding.pry
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  consolidated_cart = consolidate_cart(cart)
  cart_with_coupons_applied = apply_coupons(consolidated_cart, coupons)
  cart_with_clearance_applied = apply_clearance(cart_with_coupons_applied)
  # binding.pry
  i = 0
  total = 0.0
  while i < cart_with_clearance_applied.length do
    total += cart_with_clearance_applied[i][:price]
    i += 1
  end
  total
  binding.pry
end
