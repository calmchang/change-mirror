

read -p "请选择需要切换的对象 1:yarn&npm 2:brew" objectType
read -p "选择镜像源 1官方 2国内：" packageType

if [ $objectType = "2" ]
then
  if [ $packageType = "1" ]
  then

  cd "$(brew --repo)"
  git remote set-url origin https://github.com/Homebrew/brew.git

  cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
  git remote set-url origin https://github.com/Homebrew/homebrew-core


  else

  cd "$(brew --repo)"
   
  git remote set-url origin https://mirrors.aliyun.com/homebrew/brew.git
   
  cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
   
  git remote set-url origin https://mirrors.aliyun.com/homebrew/homebrew-core.git
   
  echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles' >> ~/.bash_profile
  source ~/.bash_profile

  fi
fi

if [ $objectType = "1" ]
then
  if [ $packageType = "1" ]
  then
  yarn config delete sass_binary_site -g
  yarn config delete registry -g
  yarn config delete disturl -g
  yarn config delete sharp_dist_base_url -g
  yarn config delete electron_mirror -g
  yarn config delete puppeteer_download_host -g
  yarn config delete phantomjs_cdnurl -g
  yarn config delete sentrycli_cdnurl -g
  yarn config delete sqlite3_binary_site -g
  yarn config delete python_mirror -g

  npm config delete sass_binary_site -g
  npm config delete registry -g
  npm config delete disturl -g
  npm config delete sharp_dist_base_url -g
  npm config delete electron_mirror -g
  npm config delete puppeteer_download_host -g
  npm config delete phantomjs_cdnurl -g
  npm config delete sentrycli_cdnurl -g
  npm config delete sqlite3_binary_site -g
  npm config delete python_mirror -g

  else
  yarn config set sass_binary_site http://npm.taobao.org/mirrors/node-sass -g
  yarn config set registry https://registry.npm.taobao.org -g
  yarn config set disturl https://npm.taobao.org/dist -g
  yarn config set sharp_dist_base_url https://npm.taobao.org/mirrors/sharp-libvips/ -g
  yarn config set electron_mirror https://npm.taobao.org/mirrors/electron/ -g
  yarn config set puppeteer_download_host https://npm.taobao.org/mirrors/ -g
  yarn config set phantomjs_cdnurl https://npm.taobao.org/mirrors/phantomjs/ -g
  yarn config set sentrycli_cdnurl https://npm.taobao.org/mirrors/sentry-cli/ -g
  yarn config set sqlite3_binary_site https://npm.taobao.org/mirrors/sqlite3/ -g
  yarn config set python_mirror https://npm.taobao.org/mirrors/python/ -g

  npm config set sass_binary_site http://npm.taobao.org/mirrors/node-sass -g
  npm config set registry https://registry.npm.taobao.org -g
  npm config set disturl https://npm.taobao.org/dist -g
  npm config set sharp_dist_base_url https://npm.taobao.org/mirrors/sharp-libvips/ -g
  npm config set electron_mirror https://npm.taobao.org/mirrors/electron/ -g
  npm config set puppeteer_download_host https://npm.taobao.org/mirrors/ -g
  npm config set phantomjs_cdnurl https://npm.taobao.org/mirrors/phantomjs/ -g
  npm config set sentrycli_cdnurl https://npm.taobao.org/mirrors/sentry-cli/ -g
  npm config set sqlite3_binary_site https://npm.taobao.org/mirrors/sqlite3/ -g
  npm config set python_mirror https://npm.taobao.org/mirrors/python/ -g
  fi

  yarn config delete proxy
  npm config rm proxy
  npm config rm https-proxy

  npm cache clean --force
  yarn cache clean 
fi
