require './lib/session'

print "Hello! Enter a search term to find books: "
search_term = gets.strip

session = Session.new
session.search(search_term)
