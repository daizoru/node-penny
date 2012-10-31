node-penny
==========

Penny add a few helper properties to generate currency from numbers.

See /examples to see how it works. 

Operations on amounts of same currency:

```CoffeeScript
require 'penny'

e = 100.EUR.add 11.50.EUR
console.log "#{e}"

d = 100.USD.sub 50.USD
console.log #{d}"
```

which should print :

```
+111.5€  # in green
-$50     # in yellow
```

There are also shortcuts for big numbers:

```CoffeeScript
console.log "#{400.K.USD}"
console.log "#{1.M.EUR}"
console.log "#{1.B.USD}"
```

