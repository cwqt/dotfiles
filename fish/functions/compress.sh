#!/bin/bash

usage="$(basename "$0") [-h] [-i] -- program that uses ffmpeg to convert mac screencapture .mov to a compressed mp4 for sharing

where:
    -h  show this help text
    -i  (required) the mov file to convert to mp4

dependencies: 
    Requires ffmpeg to be installed and available in the user's PATH.
    You may install it on mac using brew install ffmpeg"

while getopts 'hi:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    i) inFile=$OPTARG
       ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
    *) echo "Unimplemented option: -$OPTARG" >&2;
       exit 1
       ;;
  esac
done
shift $((OPTIND - 1))

if [ -z "$inFile" ]
then
  echo "Please specify an input file with -i"
  exit 1
fi

filename=$(basename "$inFile")
extension="${filename##*.}"
filename="${filename%.*}"

if [ "$extension" != "mov" ]
then
  echo "Input must be an mov file"
  exit 1
fi

# Explanation of the settings
# movflags          – This option optimizes the structure of the MP4 file so the browser can load it as quickly as possible.
# pix_fmt           – MP4 videos store pixels in different formats. We include this option to specify a specific format 
#                     which has maximum compatibility across all browsers.
# tune stillimage   - optimizes for when most frames are a still image like screenshots
# crf 30            - A high constant rate factor to compress more but sacrifice some quality since this is just a screenshot
# vf scale=...      - Ensure that the video height and width are divisible by 2, otherwise some players won't play it
# an                - make sure there's no audio stream included

ffmpeg -i "$inFile" -movflags faststart -pix_fmt yuv420p -tune stillimage -crf 30 -vf 'scale=trunc(iw/2)*2:trunc(ih/2)*2' -vcodec h264 -an "$filename".mp4
