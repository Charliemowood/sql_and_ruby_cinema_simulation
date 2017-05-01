require_relative( '../models/customers' )
require_relative( '../models/films' )
require_relative( '../models/tickets' )

require( 'pry-byebug' )

customer1 = Customer.new({ 'name' => "Garry"})
customer1.save()
customer2 = Customer.new({ 'name' => "Harry"})
customer2.save()

binding.pry
nil
