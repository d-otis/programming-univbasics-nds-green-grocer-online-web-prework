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
    ]
	
	coupons = 	[
		{:item => "AVOCADO", :num => 2, :cost => 5.00},
		{:item => "BEER", :num => 2, :cost => 20.00},
		{:item => "CHEESE", :num => 3, :cost => 15.00}
	]


def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  # * Arguments:
  #   * `String`: name of the item to find
  #   * `Array`: a collection of items to search through
  # * Returns:
  #   * `nil` if no match is found
  #   * the matching `Hash` if a match is found between the desired name and a given 
  #     `Hash`'s :item key
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
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
    #   * Arguments:
    #   * `Array`: a collection of item Hashes
    # * Returns:
    #   * a ***new*** `Array` where every ***unique*** item in the original is present
    #     * Every item in this new `Array` should have a `:count` attribute
    #     * Every item's `:count` will be _at least_ one
    #     * Where multiple instances of a given item are seen, the instance in the
    #       new `Array` will have its `:count` increased
  i = 0
  result = []
  while i < cart.length do
    name = cart[i][:item]
    cart[i][:count] = 1
    if result.empty?
      result << cart[i]
    elsif find_item_by_name_in_collection(name, result)
      repeat_item = find_item_by_name_in_collection(name, result)
      repeat_item[:count] += 1
    else
      result << cart[i]
    end
  i += 1
  end
  # binding.pry
 result
end

# consolidate_cart(items)

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  #   * Arguments:
  #   * `Array`: a collection of item `Hash`es
  #   * `Array`: a collection of coupon `Hash`es
  # * Returns:
  #   * A ***new*** `Array`. Its members will be a mix of the item `Hash`es and,
  #     where applicable, the "ITEM W/COUPON" `Hash`. Rules for application are
  #     described below.
  
  consolidated_cart = consolidate_cart(cart)
  # binding.pry
  i = 0
  result = []
  while i < consolidated_cart.length do
    item = consolidated_cart[i]
    item_name = item[:item]
    coupon_data = find_item_by_name_in_collection(item_name, coupons)
    # binding.pry
    if !coupon_data           # if a matching coupon isn't found
      result << item          # pass the item along
    else
      remainder_item = {}
      discounted_item = {}
      
      coupon_num = coupon_data[:num]
      item_count = item[:count]
      remainder = item_count % coupon_num
      
      remainder_item[:item] = item[:item]
      remainder_item[:count] = remainder
      remainder_item[:price] = item[:price]
      remainder_item[:clearance] = item[:clearance]
      result << remainder_item
      
      discounted_item[:count] = coupon_num
      discounted_item[:item] = "#{discounted_item[:item]} W/COUPON"
    end
    binding.pry
    i +=1
  end
  result
end

apply_coupons(items, coupons)

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
