#!/usr/bin/env coffee
require 'penny'

balance = 100.USD

balance = balance.add 50.USD
console.log "balance: #{balance}"

balance = balance.sub 50.USD
console.log "balance: #{balance}"

balance = balance.set 80.USD
console.log "balance: #{balance}"

balance = balance.set 81.USD
console.log "balance: #{balance}"

balance = balance.set 79.USD
console.log "balance: #{balance}"

balance = balance.set (-10).USD
console.log "balance: #{balance}"
