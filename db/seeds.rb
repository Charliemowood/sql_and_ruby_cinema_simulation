require_relative( '../models/customer' )
require_relative( '../models/film' )
require_relative( '../models/ticket' )

require( 'pry-byebug' )

customer1 = Customer.new({ 'name' => "Garry"})
customer1.save()
customer2 = Customer.new({ 'name' => "Harry"})
customer2.save()

film1 = Film.new({ 'title' => 'Star Wars', 'price' => 5})
film1.save()
film2 = Film.new({ 'title' => 'Too fast', 'price' => 4})
film2.save()

binding.pry
nil
