# Instagram Scraper

Instagram Scraper to Get Post Images &amp; video URL for Download

## Requirements

- wget
- grep
- xdg-open (View the Image and video in Browser)

## Setup

- Use git to clone or download it via wget

```
git clone https://github.com/mskian/instagram-scraper-bash.git
```

``
wget https://raw.githubusercontent.com/mskian/instagram-scraper-bash/master/insta.sh
```

- Give Permission

```
chmod +x insta.sh
```

- Execute the Script

```
./insta.sh
```

## How to use

**Display Help Message**

- `./insta.sh -h`

```
insta.sh [options]

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
```

- `./insta.sh -i`  - Scrap the Post image URL
- `./insta.sh -v`  - Scrap the Post Video URL


## License

MIT

