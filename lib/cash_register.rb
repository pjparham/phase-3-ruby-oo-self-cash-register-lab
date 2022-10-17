require 'pry'
class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity = 1)
        quantity.times { @items << title }
        @last_transaction = price * quantity
        self.total += price * quantity
    end

    def apply_discount
        if discount != 0
            self.total = self.total - discount * 0.01 * total
            "After the discount, the total comes to $#{self.total.round()}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= @last_transaction
    end

end
