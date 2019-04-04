# pset
the classic engine had a `pset` operator and this is code to do a similar thing

to use this, set up two picos connected by a subscription,
as suggested by the `template` file

in the Testing tab of the "psetter" pico, invoke the function with some value for "key"

notice that the pico will now have an entity variable containing that value,
set (indirectly) by the function

## Principles of Operation
we recently added an option to `http` calls, named `autosend`

when it is present, the HTTP request is asynchronous, and when it completes
an event will be sent to the designated pico
