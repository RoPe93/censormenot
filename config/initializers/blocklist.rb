require 'rubygems'
require 'zip/zip'
require 'net/http'


LIST_PATH = '/tmp/PrimaryThreats.txt'
ARCHIVE_NAME = "/tmp/PrimaryThreats.zip"
ARCHIVE_LINK = 'http://tbg.iblocklist.com/Lists/PrimaryThreats.zip'
ARCHIVE_HOST = 'iblocklist.commiecast.com'
ARCHIVE_PATH = '/f/ciifsfbtiqvtygemuxtp/PrimaryThreats.zip'

def download_file(file)
  puts "Download archive"
  Net::HTTP.start(ARCHIVE_HOST) do |http|
    resp = http.get(ARCHIVE_PATH)
    open(file, "wb") do |file|
      file.write(resp.body)
    end
  end
  puts "Finished downloading archive"
end

def unzip_file (file)
  puts "Extracting archive"
  Zip::ZipFile.open(file) do |zip_file|
   zip_file.each do |f|
     next if f.name != "PrimaryThreats.txt"
     File.delete(LIST_PATH) if File.exists?(LIST_PATH)
     zip_file.extract(f, LIST_PATH)
   end
  end
end

def read_block_ranges
  puts "Reading primary threats"
  file = File.open(LIST_PATH, "r")
  id = 1
  ip_ranges = []
  file.lines.each do |line|
    begin
      start_ip, end_ip = line.chomp("\r\n").split(':')[-1].split('-')
      ip_ranges << {:start_ip_s => start_ip, :end_ip_s => end_ip}
    rescue
      id += 1
    end
  end

  ip_ranges
end

def get_block_list
  download_file(ARCHIVE_NAME)
  unzip_file(ARCHIVE_NAME)
  ip_ranges = read_block_ranges

  ip_ranges.each do |range|
    BlockedRange.create(range)
  end
end
