```sh
Last login: Sat Mar 17 22:17:53 on ttys000
~$ npm install -g webpack
/Users/sheny/.nvm/versions/node/v8.9.4/bin/webpack -> /Users/sheny/.nvm/versions/node/v8.9.4/lib/node_modules/webpack/bin/webpack.js
+ webpack@4.1.1
added 157 packages, removed 101 packages, updated 36 packages and moved 2 packages in 16.368s


   ╭─────────────────────────────────────╮
   │                                     │
   │   Update available 5.6.0 → 5.7.1    │
   │     Run npm i -g npm to update      │
   │                                     │
   ╰─────────────────────────────────────╯

~$ npm install --save-dev webpack

> fsevents@1.1.3 install /Users/sheny/node_modules/fsevents
> node install

[fsevents] Success: "/Users/sheny/node_modules/fsevents/lib/binding/Release/node-v57-darwin-x64/fse.node" already installed
Pass --update-binary to reinstall or --build-from-source to recompile
npm WARN saveError ENOENT: no such file or directory, open '/Users/sheny/package.json'
npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN enoent ENOENT: no such file or directory, open '/Users/sheny/package.json'
npm WARN sheny No description
npm WARN sheny No repository field.
npm WARN sheny No README data
npm WARN sheny No license field.

+ webpack@4.1.1
added 422 packages in 15.515s
~$ cd /Users/sheny/Dropbox/AA/aA-homeworks/W6D1
~/Dropbox/AA/aA-homeworks/W6D1 (master)$ mkdir webpack-demo && cd webpack-demo
~/Dropbox/AA/aA-homeworks/W6D1/webpack-demo (master)$ npm init -y
Wrote to /Users/sheny/Dropbox/AA/aA-homeworks/W6D1/webpack-demo/package.json:

{
  "name": "webpack-demo",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}


~/Dropbox/AA/aA-homeworks/W6D1/webpack-demo (master)$ npm install --save-dev webpack

> fsevents@1.1.3 install /Users/sheny/Dropbox/AA/aA-homeworks/W6D1/webpack-demo/node_modules/fsevents
> node install

[fsevents] Success: "/Users/sheny/Dropbox/AA/aA-homeworks/W6D1/webpack-demo/node_modules/fsevents/lib/binding/Release/node-v57-darwin-x64/fse.node" already installed
Pass --update-binary to reinstall or --build-from-source to recompile
npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN webpack-demo@1.0.0 No description
npm WARN webpack-demo@1.0.0 No repository field.

+ webpack@4.1.1
added 422 packages in 17.12s
~/Dropbox/AA/aA-homeworks/W6D1/webpack-demo (master)$ touch index.html
~/Dropbox/AA/aA-homeworks/W6D1/webpack-demo (master)$ touch /src
touch: /src: Permission denied
~/Dropbox/AA/aA-homeworks/W6D1/webpack-demo (master)$ touch index.js
~/Dropbox/AA/aA-homeworks/W6D1/webpack-demo (master)$ atom .
~/Dropbox/AA/aA-homeworks/W6D1/webpack-demo (master)$ rm index.js
~/Dropbox/AA/aA-homeworks/W6D1/webpack-demo (master)$ cd ..
~/Dropbox/AA/aA-homeworks/W6D1 (master)$ cd ..
~/Dropbox/AA/aA-homeworks (master)$ g
On branch master
Your branch is up to date with 'hwk/master'.

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	W6D1/

nothing added to commit but untracked files present (use "git add" to track)
~/Dropbox/AA/aA-homeworks (master)$ git add .
~/Dropbox/AA/aA-homeworks (master)$ git commit -m "Webpack basic setup"
[master 0aa3d66] Webpack basic setup
 4 files changed, 3768 insertions(+)
 create mode 100644 W6D1/webpack-demo/index.html
 create mode 100644 W6D1/webpack-demo/package-lock.json
 create mode 100644 W6D1/webpack-demo/package.json
 create mode 100644 W6D1/webpack-demo/src/index.js
~/Dropbox/AA/aA-homeworks (master)$ git push
Counting objects: 9, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (7/7), done.
Writing objects: 100% (9/9), 24.12 KiB | 6.03 MiB/s, done.
Total 9 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/stellashen/aA-homeworks.git
   e638ba7..0aa3d66  master -> master
~/Dropbox/AA/aA-homeworks (master)$ cd W6D1
~/Dropbox/AA/aA-homeworks/W6D1 (master)$ ls
webpack-demo
~/Dropbox/AA/aA-homeworks/W6D1 (master)$ cd webpack-demo
~/Dropbox/AA/aA-homeworks/W6D1/webpack-demo (master)$ npm install --save lodash
npm WARN webpack-demo@1.0.0 No description
npm WARN webpack-demo@1.0.0 No repository field.

+ lodash@4.17.5
added 1 package in 3.948s
~/Dropbox/AA/aA-homeworks/W6D1/webpack-demo (master)$ npx webpack src/index.js --output dist/bundle.js
The CLI moved into a separate package: webpack-cli.
Please install 'webpack-cli' in addition to webpack itself to use the CLI.
-> When using npm: npm install webpack-cli -D
-> When using yarn: yarn add webpack-cli -D
~/Dropbox/AA/aA-homeworks/W6D1/webpack-demo (master)$  npm install webpack-cli -D
npm WARN deprecated babel-preset-es2015@6.24.1: 🙌  Thanks for using Babel: we recommend using babel-preset-env now: please read babeljs.io/env to update!
npm WARN deprecated nomnom@1.8.1: Package no longer supported. Contact support@npmjs.com for more info.
npm WARN webpack-demo@1.0.0 No description
npm WARN webpack-demo@1.0.0 No repository field.

+ webpack-cli@2.0.12
added 438 packages in 31.123s
~/Dropbox/AA/aA-homeworks/W6D1/webpack-demo (master)$ npx webpack src/index.js --output dist/bundle.js
Hash: dabab1bac2b940c1462b
Version: webpack 4.1.1
Time: 7233ms
Built at: 2018-3-19 00:28:22
    Asset      Size  Chunks             Chunk Names
bundle.js  69.9 KiB       0  [emitted]  main
Entrypoint main = bundle.js
   [1] (webpack)/buildin/module.js 519 bytes {0} [built]
   [2] (webpack)/buildin/global.js 509 bytes {0} [built]
   [3] ./src/index.js 256 bytes {0} [built]
    + 1 hidden module

WARNING in configuration
The 'mode' option has not been set. Set 'mode' option to 'development' or 'production' to enable defaults for this environment.
```
