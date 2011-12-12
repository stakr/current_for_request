# Current for Request

Written by stakr GbR (Jan Sebastian Siwy, Martin Spickermann, Henning Staib GbR; http://www.stakr.de/)

Source: https://github.com/stakr/current_for_request

Rack middleware to determine the current instance of a class before each request and reset to it to +nil+ after the request.


## Example

Assuming you have a class +User+ with the class attribute +current+: You can set and reset this attribute by adding an
initializer into your 'conf/initializers' folder containing:

    ActionController::Dispatcher.middleware.use Stakr::CurrentForRequest::Rack, 'User'

In this case the Rack middleware would simply set

    User.current = User.first

before the request and reset

    User.current = nil

after the request.

Usually you should implement the method +from_env+ (with the Rack environment hash as first parameter) in your model.
If implemented this method is called to determine the current instance of the class for the current request
(instead of +first+).


Copyright (c) 2009 stakr GbR (Jan Sebastian Siwy, Martin Spickermann, Henning Staib GbR), released under the MIT license
