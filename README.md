Shoppingcart
=========

Import and add products for Order and calculate ShoppingCart total cost

## Getting Started

put product file(for example products.json) at directory '/data'

run 
ruby cli.rb

### Test

run rspec for test

### Commands available

help              -- list all commands available

exit/quit         --  exit CLI

import            -- import products from json file, example: import products.json

show products     -- list all products available

add item          -- add single item to ShoppingCart by uuid, example: add item 1411

show shoppingcart -- show current order, including items and total cost of the ShoppingCart
