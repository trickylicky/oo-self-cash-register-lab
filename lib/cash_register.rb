class CashRegister
    attr_accessor :total, :receipt
    attr_reader :discount
    attr_writer

    def initialize discount=0
        @total = 0
        @discount = discount
        @receipt = []
    end

    def add_item title, price, qty=1
        @total += price * qty
        qty.times { @receipt.push ({title: title, price: price, qty: qty}) }
    end

    def apply_discount
        if @discount > 0
            savings = @total * @discount/100
            @total -= savings
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @receipt.map{ |item| item[:title] }
    end

    def void_last_transaction
        voided_item = receipt.pop
        @total -= voided_item[:price] * voided_item[:qty]
    end

end