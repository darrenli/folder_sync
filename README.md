# FolderSync

Ruby program designed to sync the contents of a target folder with that of a source based on a modifiable synchronization file.

The goal of this is to provide an easy way for a user to synchronize files from a non-dropbox folder to a dropbox folder. This would allow users who share a dropbox account to modify a single file and have the contents of an entire hierarchy of files accessible to the remote user.

Will describe this more accurately soon. Initial commit yo!

## Run

* Modify the following constants:
  * SOURCE
  * DESTINATION
  * SYNCFILE
  * WHITELIST
* ruby sync.rb

## TODO

* daemonize ruby script
* create common.rb and common.example.rb for constants
* sleep

