# Syncfile should be in the following format:
#   Synced Files:
#     - file1.mov
#     - file2.avi
#   Available Files:
#     - file3.mp4

class Syncfile
  require 'yaml'
  require './common.rb'

  SYNCED = "Synced Files:"
  UNSYNCED = "Available Files:"

  def self.generate
    data = {
      SYNCED => [],
      UNSYNCED => []
    }

    Dir.entries(SOURCE).each do |entry|
      # skip entry if not matched in whitelist
      next unless WHITELIST.inject(false){|val,x| val = val || !!entry.match(x)}
      data[UNSYNCED] << entry
    end

    return data
  end

  def self.read
    begin
      YAML.load_file(SYNCFILE)
    rescue => e
      puts "Error: #{e.message}"
    end
  end

  def self.write(data)
    File.open(SYNCFILE, "w+") do |syncfile|
      syncfile.write(data.to_yaml)
    end
  end
end

class SourceDirectory
  def self.files
    Dir.entries(SOURCE).inject([]) do |entries, entry|
      # filter out files not whitelisted
      if WHITELIST.inject(false){|val,x| val = val || !!entry.match(x)}
        entries << entry
      else
        entries
      end
    end
  end
end

class TargetDirectory
  def self.files
    Dir.entries(TARGET).inject([]) do |entries, entry|
      # filter out files not whitelisted
      if WHITELIST.inject(false){|val,x| val = val || !!entry.match(x)}
        entries << entry
      else
        entries
      end
    end
  end
end

class FolderSync
  def self.synchronize
    # delete entries from sync file if files in destination folder are missing

    # parse syncfile

    # make updates to destination folder based parsed syncfile

    # make updates to the sync file based on changes in source files
    #self.update_sync_file
    syncdata = Syncfile.generate
    Syncfile.write(syncdata)
    puts Syncfile.read.inspect

    puts SourceDirectory.files.inspect
    puts TargetDirectory.files.inspect
  end

end
