node-timmy
==========

Timmy add a few helper properties to generate milliseconds from numbers.
Be careful when using this, this can lead to hard to debug bugs and side
effect. That said, I'm using it with no problem. Surprisingly,
it even made my life easier!


```JavaScript
require('timmy');

function f () { console.log("hello"); };

setTimeout(f, 10.ms);

setTimeout(f, 2.sec);
setTimeout(f, 1.second);
setTimeout(f, 10.seconds);

setTimeout(f, 1.minute);
setTimeout(f, 15.minutes);
setTimeout(f, 5.min);

setTimeout(f, 1.hour);
setTimeout(f, 2.hours);

setTimeout(f, 1.day);
setTimeout(f, 7.days);
```

