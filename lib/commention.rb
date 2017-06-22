require "commention/version"

module Commention
  def self.process
    current_project = `pwd`
    current_project = current_project.gsub(/\n/,"")
    rbfiles = File.join("**", "*.rb")
    files = Dir.glob(rbfiles)
    files.each do |file_name|
      content = add_cmt File.read(current_project + file_name)
      File.open(current_project + "/" +file_name, "w") do |file|
        file.puts content
      end
    end
  end
end

def add_cmt content
  resulf = ""
  arr = content.split("\n")
  arr.each_with_index do |a, i|
    if arr[i].index('def') != nil
      resulf += create_cmt arr[i].strip.gsub(',', '').split(' ') if  arr[i-2] != nil &&arr[i-2].index('#') == nil
    end
    resulf += arr[i] + "\n"
  end
  return resulf
  # arr = content.split("\ex")[4].strip.gsub(',', '').split(' ')
end

def create_cmt  *args
  current_project = `pwd`
  current_project = current_project.gsub(/\n/,"")
  cmt = File.read(current_project + "/standard_cmt.txt")
  rs = ""
  cmt.split("\n").each do |item|
    if item.index('/params/') != nil
      if args[0].size > 2
        rs += item.strip.gsub("/params/","")
        args[0].drop(2).each do |i|
          rs += "\n# => " + i + " :"
        end
        rs += "\n"
      end
    else
      rs += item + "\n"
    end
  end
  rs += "\n"
end

# cmt = Cmt.process
