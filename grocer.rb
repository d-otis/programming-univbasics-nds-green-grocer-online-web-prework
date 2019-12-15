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
  while i < collection.length do
    if collection[i][:item] == name
      return collection[i]
    end
    i += 1
  end
  nil
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
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
  while i < cart.length
    current_hash = cart[i]
    current_name = cart[i][:item]
    if result.empty?
      result << current_hash
    end
    r = 0
    while r < result.length do
    
      r += 1
    end
    binding.pry
  i += 1  
  end
  
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
