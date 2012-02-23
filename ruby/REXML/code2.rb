require 'rexml/document'
include REXML
string = <<EOF
<?xml version="1.0" encoding="ISO-8859-15"?>
<!DOCTYPE bibliography PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
    "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd">
<bibliography>
    <biblioentry id="FHIW13C-1234">
      <author>
        <firstname>Godfrey</firstname>
        <surname>Vesey</surname>
      </author>
      <title>Personal Identity: A Philosophical Analysis</title>
      <publisher>
        <publishername>Cornell University Press</publishername>
      </publisher>
      <pubdate>1977</pubdate>
   </biblioentry>
</bibliography>
EOF
doc = Document.new(string)
puts doc

