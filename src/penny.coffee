#!/usr/bin/env coffee
{inspect} = require 'util'
#fx = require 'money'
require 'colors'

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


operands = []

class Amount

  constructor: (@value, @currency, @oldValue=@value) ->
    if @value > @oldValue
      if @value > 0
        @color = 'green'
      else if @value < 0
        @color = 'yellow'
      else
        @color = 'white'
    else if @value < @oldValue
      if @value > 0
        @color = 'yellow'
      else if @value < 0
        @color = 'red'
      else
        @color = 'red'
    else
      @color = 'white'

  to: (currency) =>
    unless currency of currencies
      throw "unknow #{currency}"
    if @currency.code is currency
       @value
    else
      0#fx(@value).from(@currency.code).to(currency.code)
      throw "automatic currency conversion is not implemented yet"
 
  add:       (amount) => new Amount @value + amount.to(@currency.code), @currency, @value
  substract: (amount) => new Amount @value - amount.to(@currency.code), @currency, @value
  multiply:  (amount) => new Amount @value * amount.to(@currency.code), @currency, @value
  set:       (amount) => new Amount          amount.to(@currency.code), @currency, @value
  sub:       (amount) => @substract amount
  mul:       (amount) => @multiply amount
  mult:      (amount) => @multiply amount

  sameCurrency: (other) =>
    @currency.code is other.code

  isNegative: => @value <  0
  isPositive: => @value >  0
  isZero    : => @value is 0

  toString  : =>
    sign = do =>
      if @value is @oldValue
        if @value > 0 then '+' else (if @value < 0 then '-' else ' ')
      else
        if @value > @oldValue then '+' else (if @value < @oldValue then '-' else ' ')
    
    str = do =>
      if @currency.prefix
        "#{sign}#{@currency.symbol}#{Math.abs @value}"
      else
        "#{sign}#{Math.abs @value}#{@currency.symbol}"

    switch @color
      when 'green'  then str.green
      when 'red'    then str.red
      when 'yellow' then str.yellow
      else
        str

for currencyName, currency of currencies
  do (currencyName, currency) ->
    Object.defineProperty Number.prototype, currencyName.toUpperCase(),
      enumerable: no
      configurable: no
      get: -> 
        new Amount (0+this), currency

    Object.defineProperty Number.prototype, currencyName.toLowerCase(),
      enumerable: no
      configurable: no
      get: -> 
        new Amount (0+this), currency
   
Object.defineProperty Number.prototype, 'B',
  enumerable: no
  configurable: no
  get: -> (0+this) * 1000000000

Object.defineProperty Number.prototype, 'M',
  enumerable: no
  configurable: no
  get: -> (0+this) * 1000000

Object.defineProperty Number.prototype, 'K',
  enumerable: no
  configurable: no
  get: -> (0+this) * 1000

