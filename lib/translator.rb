require 'yaml'
require 'pry'



def load_library(path)
  
  emoticons = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file(path).each do |meaning, describe|
     eng, jan = describe
     emoticons["get_meaning"][jan] = meaning
     emoticons["get_emoticon"][eng] = jan
  end
  emoticons
end 

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  emoji = emoticons.values.find {|faces| faces[0] == emoticon}
  emoji == nil ? "Sorry, that emoticon was not found" : emoji[1]
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  emoji = emoticons.find {|name, faces| faces[1] == emoticon }
  emoji == nil ? "Sorry, that emoticon was not found" : emoji[0]
end
