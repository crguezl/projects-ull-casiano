#encoding: utf-8
class Hola_casiano
  def self.hi(language = "english")
    translator = Translator.new(language)
    puts translator.hi
  end
end
require "hola_casiano/translator"
