# FolderSync

Lightweight ruby daemon designed to sync the contents of a target folder with that of a source based on a modifiable synchronization file.

The goal of this is to provide an easy way for a user to synchronize files from a non-dropbox folder to a dropbox folder. This would allow users who share a dropbox account to modify a single file and have the contents of an entire hierarchy of files accessible to the remote user.

Will describe this more accurately soon. Initial commit yo!

## Preparation

```
$ bundle install
$ ./test/prepare.sh
```

## Run

* Modify the following constants:
  * SOURCE
  * DESTINATION
  * SYNCFILE
  * WHITELIST

```
$ ./run.sh
```

## TODO

* deserialize yaml instead of using a parsing a custom file format

```
# Notes about file
Synced File:
  - file1.mov
  - file2.avi
Available Files:
  - file3.mp4

```

* implement syncfile parsing logic
* implement file synchronization logic
* implement syncfile updating logic
* write tests
* daemonize ruby script
* monitor file system changes via Guard gem
* sleep

## Links

* [Bundler](http://gembundler.com)
* [Guard Gem](https://github.com/guard/guard)
* [Daemons Gems](http://daemons.rubyforge.org/)
* [Daemon Processes](http://www.jstorimer.com/2012/04/19/daemon-processes-in-ruby.html)
* [Launch Daemons](http://snippets.aktagon.com/snippets/212-How-to-create-a-daemon-process-using-Ruby-and-the-daemons-RubyGem)
