class FolderSync
  require './common.rb'

  def self.synchronize
    # delete entries from sync file if files in destination folder are missing

    # parse syncfile

    # make updates to destination folder based parsed syncfile

    # make updates to the sync file based on changes in source files
    self.update_sync_file
  end

  private

    def self.update_sync_file
      # open file for read / write
      file = File.new(SYNC_FILE, "w+")

      Dir.entries(SOURCE).each do |entry|
        # skip entry if not matched in whitelist
        next unless WHITELIST.inject(false){|val,x| val = val || !!entry.match(x)}

        file.write("#{entry}\n")
      end
    end

end
