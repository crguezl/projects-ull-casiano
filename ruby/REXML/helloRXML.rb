require "rexml/document"
include REXML

doc = Document.new("<verdad-verdadera>Ya llega el veranito</verdad-verdadera>")
print doc.root.name, ": ", doc.root.text, "\n"
