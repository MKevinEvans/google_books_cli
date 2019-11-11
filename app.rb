require './lib/session'

session = Session.new
print "Hello! Enter a search term to find books: "
search_term = session.io.receive_input.strip
session.search(search_term)
