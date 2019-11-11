require './lib/session'

session = Session.new
session.io.produce_output "Hello! Enter a search term to find books: "
search_term = session.io.receive_input.strip
session.search(search_term)
