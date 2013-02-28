class FolderSync
  SOURCE = "/Users/darrencheng/Dropbox/Movies".freeze
  DESTINATION = "/Users/darrencheng/Desktop/sync/files".freeze
  SYNC_FILE = "/Users/darrencheng/Desktop/sync/Syncfile"
  WHITELIST = [
    /\.mp4/,
    /\.mov/,
    /\.avi/
  ]

  def self.synchronize
    #Dir.chdir(SOURCE)
    #puts Dir.pwd
    #puts SOURCE
    #puts DESTINATION
    #Dir.entries(SOURCE).each do |entry|
    #  puts entry
    #end

    self.update_sync_file
  end

  private

    def self.update_sync_file
      # create sync file if non-existant
      unless File.exists?(SYNC_FILE)
        File.new(SYNC_FILE, File::CREAT, 0644)
      end

      # open file for read / write
      file = File.new(SYNC_FILE, "w+")

      Dir.entries(SOURCE).each do |entry|
        # skip entry if not matched in whitelist
        next unless WHITELIST.inject(false){|val,x| val = val || !!entry.match(x)}

        file.write("#{entry}\n")
      end
    end

end
