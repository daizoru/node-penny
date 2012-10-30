node-penny
==========

Penny add a few helper properties to generate currency from numbers.

See /examples to see how it works. 

Spoiler:

```CoffeeScript
require 'penny'

e = 100.EUR.add 11.50.EUR
console.log "#{e}"

d = 100.USD.sub 50.USD
console.log #{d}"
```

