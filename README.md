Likerfire - The Facebook "Likes" Comparison Engine
==================================================

Design Choices
--------------

I chose to use Sinatra instead of Rails primarily because the user interface
requirements were small.  In general I tend to lean towards Sinatra when there
will be little to no interface requirements and Rails when there will be an extensive
UI.  In the end I went without a database as well.  I started the project
with a database, but it only had one table for users and it didn't make much sense
to continue using one when I was updating the entire contents of a User object every
time a user logged in.  I chose to use OmniAuth to do the Facebook OAuth authentication
because it was so easy to set up when I tried it out on a Twitter app this past weekend.
The file and folder layout of the project is meant to be very similar to the ruby standard
gem file and folder layout.  I like using that since it should be familiar to ruby developers.
I also like to break up the main Sinatra app file into multiple route files based roughly
around resources so that they are easier to manage.  On thing I did not do that I would
usually do is to have a Controller layer that sits between the routes and the models.
I generally like to have the route definitions handling the HTTP requests and responses 
and then have a controller handle marshalling the submitted data with the models. 
 Since this app was so small I left out that layer.  Finally, I went ahead and just used 
 TestUnit and Rack-Test for testing.  I had a little bit of trouble figuring out how to store variables in
the Rack-Test sessions and after googling for some insight I found that there doesn't
seem to be an easy solution to that problem. Overall this is a similar pattern to how I
would approach any API style app with the addition of an appropriate datastore and probably
RSpec to help with easier stubbing/mocking of the tests.


Further Improvement
-------------------

The most obvious place for improvement of the app is the UI.  I left it very sparse
because of the directions, but it would be one of the first places I would target for
improvement.  The second place that would need to be improved is the error handling.  I
intentionally left out error handling, but if I were to take the app any further that 
would be high on the list of priorities.  Along with error handling would be a more
robust set of tests.  Right now I'm only checking the success conditions, but
adding error handling and then the tests to make sure that is working correctly 
would be needed.  As far as feature improvements it would be interesting to add 
percentage of compatibility, perhaps a graph of which friends like the same things, 
the ability to post the results of your comparison back to you and your friends wall, maybe
a running total of how many "Likes" you share with all your friends combined, the ability 
to figure out who your most compatible friend is, etc.  