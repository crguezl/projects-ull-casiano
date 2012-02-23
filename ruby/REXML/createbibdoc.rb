require 'rexml/document'
include REXML

doc = Document.new # empty document
doc.add_element("bibliography", { "id" => "philosophy" })

puts doc

doc.root.add_element("biblioentry")

puts doc

biblioentry = doc.root.elements[1]
author = Element.new('author')
author.add_element('firstname')
author.elements['firstname'].text = 'Bertrand'

author.add_element('surname')
author.elements['surname'].text = "Rusell"

puts
puts author

biblioentry.elements << author

title = Element.new('title')
title.text = 'The Problems of Philosophy'

biblioentry.elements << title

biblioentry.elements << Element.new("pubdate")

biblioentry.elements['pubdate'].text = '1912'

biblioentry.add_attribute('id', 'ISBN0-19-285423-2')

puts 
puts doc
