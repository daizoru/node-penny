#!/usr/bin/env coffee
require 'penny'

e = 100.EUR.add 11.50.EUR
console.log "euro add: #{e}"

d = 100.USD.sub 50.USD
console.log "dollar sub: #{d}"

f = e.add d
console.log "euro dollar add: #{f}"

