require 'pry'

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
  results = {}
  while i < collection.length do
    if collection[i][:item] == name
      collection[i]
    else
      nil
    end
    i += 1
  end
  binding.pry
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
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
