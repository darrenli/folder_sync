BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SOURCE="$BASE/source"
TARGET="$BASE/target"

# remove test files and artifacts
rm -rf $SOURCE
rm -rf $TARGET
rm "$BASE/Syncfile.yml"

# create test file
mkdir $SOURCE
touch "$SOURCE/file1.mov"
touch "$SOURCE/file2.avi"
touch "$SOURCE/file3.mp4"
mkdir $TARGET

