#!/usr/bin/env coffee
#fx = require 'money'

currencies = {}

currencies.USD = USD =
  code: 'USD'
  name: 'U.S. Dollar'
  symbol: '$'
  prefix: yes

currencies.EUR = EUR =
  code: 'EUR'
  name: 'Euro'
  symbol: '€'
  prefix: no

class Amount

  constructor: (@value, @currency=USD) ->
  
  to: (currency) =>
    unless currency of currencies
      throw "unknow #{currency}"
    if @currency.code is currency
       @value
    else
      0#fx(@value).from(@currency.code).to(currency.code)
      throw "automatic currency conversion is not implemented yet"
 
  add: (amount) =>
    @value = @value + amount.to(@currency.code)
    @
  substract: (amount) =>
    @value = @value - amount.to(@currency.code)
    @
  sub: (amount) =>
    @substract amount
  multiply: (amount) =>
    @value = @value * amount.to(@currency.code)
    @
  mul: (amount) =>
    @multiply amount
  mult: (amount) =>
    @multiply amount

  sameCurrency: (other) =>
    @currency.code is other.code

  isNegative: => @value <  0
  isPositive: => @value >  0
  isZero    : => @value is 0

  toString  : =>
    if @currency.prefix
      "#{@currency.symbol}#{@value}"
    else
      "#{@value}#{@currency.symbol}"

for currencyName, currency of currencies
  #console.log "registering currency #{currencyName}"
  Object.defineProperty Number.prototype, currencyName.toUpperCase(),
    enumerable: no
    configurable: no
    get: -> 
      new Amount 0+this, currency

  Object.defineProperty Number.prototype, currencyName.toLowerCase(),
    enumerable: no
    configurable: no
    get: -> 
      new Amount 0+this, currency
   
     
