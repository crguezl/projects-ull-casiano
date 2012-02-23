require 'rexml/document'
include REXML

doc = Document.new File.new 'bibliography.xml'
root = doc.root

# <bibliography id="personal_identity">
puts
p root

# <bibliography id="personal_identity">
puts
p root.attributes['id']

# <bibliography id="personal_identity">
#     <biblioentry id="FHIW13C-1234">
#       <author>
#         <firstname>Godfrey</firstname>
#         <surname>Vesey</surname>
#       </author>
#       <title>Personal Identity: A Philosophical Analysis</title>
#       <publisher>
#         <publishername>Cornell University Press</publishername>
#       </publisher>
#       <pubdate>1977</pubdate>
#    </biblioentry>
puts
puts root.elements[1].elements["author"]
puts
puts root.elements["biblioentry[1]"]
puts
puts root.elements["biblioentry[1]/author"]
puts 
puts root.elements["biblioentry[1]/author/surname"]
puts
puts root.elements["biblioentry[@id='FHIW13C-1234']/author/firstname"]

puts
root.each_element('//title') { |t| puts t.text }

puts
root.each_child { |c| puts c.is_a?(REXML::Element)? c.attributes['id'] : "<#{c}>" } 
