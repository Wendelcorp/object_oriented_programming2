class Receipt

  def initialize
    @transactions = []
  end

  def add_transaction(description, price, tax)
    # A method to add each transaction
    # Let's store transactions as an array of hashes, so we can call the keys for calculations.
    @transactions.push(description: description, price: price, tax: tax)
  end

  def subtotal
    # let's call each amount and add them together to calculate the subtotal
    subtotal = 0.0
    @transactions.each do |i|
      subtotal += i[:price]
    end
    return subtotal
  end

  def tax
    # let's calculate the tax amount
    tax = 0
    @transactions.each do |i|
      if i[:tax] == 0.05
        tax += i[:tax] * 1.05
      elsif i[:tax] == 0.10
        tax += i[:tax] * 1.10
      elsif i[:tax] == 0.15
        tax += i[:tax] * 1.15
      else
        tax += i[:tax]
      end
    end
    return tax
  end

  def print_receipt
    #lets print a nicely formatted receipt
    puts '
┌───────────────────────────────────────┐
│      , __                             │
│     /|/  \              o             │
│      |___/  _   __   _       _ _|_    │
│      | \   |/  /    |/  |  |/ \_|     │
│      |  \_/|__/\___/|__/|_/|__/ |_/   │
│                           /|          │
└───────────────────────────────────────┘
    '
    puts "Thank You!".rjust(25)
    puts "Come again...".rjust(27)
    puts "Description".ljust(30) + "Amount".rjust(10)
    puts "-" * 40
    @transactions.each do |i|
      puts i[:description].ljust(30) + i[:price].to_s.rjust(10)
    end
    puts "-" * 40
    puts "Subtotal:".ljust(30) + subtotal.to_s.rjust(10)
    puts "Tax:".ljust(30) + tax.round(2).to_s.rjust(10)
    puts "-" * 40
    puts "Total:".ljust(30) + (tax + subtotal).round(2).to_s.rjust(10)
    puts ""
  end

end

transaction1 = Receipt.new

transaction1.add_transaction("Kit Kat bar", 1.99, 0.10)
transaction1.add_transaction("Pepsi can 355ml", 1.49, 0.10)
transaction1.add_transaction("Dentene Ice", 1.29, 0.05)
transaction1.add_transaction("Fair-Trade coffee", 5.99, 0.00)
transaction1.add_transaction("Twizzlers", 2.29, 0.10)

transaction1.print_receipt
