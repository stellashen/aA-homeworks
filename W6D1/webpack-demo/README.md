# Terminal
I was following this guide:
https://webpack.js.org/guides/getting-started/

## Basic setup
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
```
## Creating a bundle
```sh
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

## Using a Configuration
```sh
~/Dropbox/AA/aA-homeworks/W6D1/webpack-demo (master)$ touch webpack.config.js
~/Dropbox/AA/aA-homeworks/W6D1/webpack-demo (master)$ npx webpack --config webpack.config.js
Hash: dabab1bac2b940c1462b
Version: webpack 4.1.1
Time: 355ms
Built at: 2018-3-19 00:41:07
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

## Set the mode option
reference: https://www.valentinog.com/blog/webpack-4-tutorial/#webpack_4_production_and_development_mode

"webpack 4 introduces production and development mode."

"In webpack 4 you can get by without a single line of configuration! Just define the --modeflag and you get everything for free!"

Add the following code to `package.json`:
```
"scripts": {
  "dev": "webpack --mode development",
  "build": "webpack --mode production"
}
```

reference: https://scotch.io/tutorials/whats-new-in-webpack-4#the-mode-property
You can set your mode in the webpack.config.js file to either development or production.
```
module.exports = {
  mode: 'development'
}
```
## NPM Scripts
```sh
~/Dropbox/AA/aA-homeworks/W6D1/webpack-demo (master)$ npm run build

> webpack-demo@1.0.0 build /Users/sheny/Dropbox/AA/aA-homeworks/W6D1/webpack-demo
> webpack --mode production

Hash: 8ec3b66b6a8865a2e29f
Version: webpack 4.1.1
Time: 368ms
Built at: 2018-3-19 00:56:45
    Asset      Size  Chunks             Chunk Names
bundle.js  69.9 KiB       0  [emitted]  main
Entrypoint main = bundle.js
   [1] (webpack)/buildin/module.js 519 bytes {0} [built]
   [2] (webpack)/buildin/global.js 509 bytes {0} [built]
   [3] ./src/index.js 256 bytes {0} [built]
    + 1 hidden module
```
