#!/bin/bash

# -----------------------------------------------------------------------------
# Info:
#   author:    Santhosh veer
#   file:      insta.sh
#   created:   28.04.2018
#   revision:  28.04.2018
#   version:   0.1
# -----------------------------------------------------------------------------
# Requirements:
#   wget, grep
# Description:
#   Instagram Scraper to Get Post Images & video URL for Download
#
# -----------------------------------------------------------------------------

# Version Info
VERSION=0.1

## File name
SCRIPTNAME=$(basename "$0")


## wget Functions

grp_image_url() {

wget -q -O - "$imageurl" | grep og:image | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | sort | uniq

}

grp_video_url() {

wget -q -O - "$videourl" | grep og:video:secure_url | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | sort | uniq

}

## Open in Browser

view_object() {
xdg-open "$data"
}


## Instagram Scraper to Get Image URLS

get_image_url(){

echo -e "\\n"
echo -ne "\\033[1;32m Enter a image Post URL: \\033[0m"
read -r imageurl

  if [[ ! $imageurl ]]; then
    echo -e "\\n"
    echo -e "\\033[1;31m Error: Text Field is Missing \\033[0m \\n"
    exit 1
  fi

data=$(grp_image_url)

echo -e "\\n"
echo -e "\\033[1;36m Image Download URL 🚀  ➡  $data \\033[0m"
echo -e "\\n"
echo -e "\\033[1;33m Download Image  📲  Just run this Command  ➡  wget $data \\033[0m"
echo -e "\\n"

}

## Instagram Scraper to Get Video URLS

get_video_url(){

echo -e "\\n"
echo -ne "\\033[1;32m Enter a Video Post URL: \\033[0m"
read -r videourl

 if [[ ! $videourl ]]; then
    echo -e "\\n"
    echo -e "\\033[1;31m Error: Text Field is Missing \\033[0m \\n"
    exit 1
  fi

data=$(grp_video_url)

echo -e "\\n"
echo -e "\\033[1;36m video Download URL 🚀 ➡  $data \\033[0m"
echo -e "\\n"
echo -e "\\033[1;33m Download video  📲  Just use this Command  ➡  wget $data \\033[0m"
echo -e "\\n"

}

# Help Message
help(){
  echo -e "\\n"
  echo -e  "$SCRIPTNAME [options]

           Instagram Scraper to Get Post Images & video URL for Download 📲
        
           Examples:
           insta.sh -i

           View on Browser 
           insta.sh -i -b

           Scrape 👩 💻 and View it on Browser 
           insta.sh -i -b

          Options:
          -i   Scrape post image Download URL
          -v   Scrape post video Download URL
          -h   Display Help Message
          -b   View Image or Video in Browser Easy to Download
          -c   Check CLI Version
          \\n"
}

# No input params triggers this error
check_for_empty_input(){
  if [ $# -eq 0 ];
  then
      echo -e "\\n"
      echo -e "\\033[1;31m Error:  No input \\033[0m \\n"
      help
      exit 1
    fi
}

# Check for required packages
check_requirements(){
  local requirements=("$@")
  for app in "${requirements[@]}"; do
    type "$app" >/dev/null 2>&1 || \
      { echo >&2 "$app is required but it's not installed. Aborting."; exit 1; }
  done
}

# Main Functions
main(){
  check_for_empty_input "$@"
  check_requirements wget grep

  while getopts ':ivbch' flag; do
  case "$flag" in 
i)
  get_image_url
  ;;
v)
  get_video_url
  ;;
b)
  view_object
  exit 0
  ;;
c)
  echo -e "\\033[1;32m Version $VERSION \\033[0m"
  exit 0
  ;;
h) 
help
exit 0
;;
  ?)
  echo "script usage: $SCRIPTNAME [-1] [-v] [-b] [-h]" >&2
  exit 1
  ;;
*)

 esac
done
  shift $((OPTIND-1))
}

main "$@"

exit 0
