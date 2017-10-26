// This is used to generate the style.json for the map, 
// for now it's just pointing to localhost for the sprites,
// but in the future it will be updated to work correctly with AWS hosting

// Forked from https://github.com/klokantech/gl-style-package-spec/blob/master/task/deploy.js
// and https://github.com/klokantech/gl-style-package-spec/blob/master/task/transform.js

var langFallback = require('./lang-fallback.js');
var fs = require('fs-extra');

var adjustStyle = function(opts) {

  var style = opts.style;

  delete style.created;
  delete style.draft;
  delete style.modified;
  delete style.owner;

  if (style.sources['openmaptiles']) {
    style.sources['openmaptiles'] = {
      "type": "vector",
      "url": "https://free.tilehosting.com/data/v3.json?key=RiS4gsgZPZqeeMlIyxFo"
    }
  }

  if(opts.needSprite) {
    style.sprite = "http://localhost:3000/mapboxstyle/sprite";
  } else {
    delete style.sprite;
  }

  style.glyphs = "https://free.tilehosting.com/fonts/{fontstack}/{range}.pbf?key=RiS4gsgZPZqeeMlIyxFo";

  var langCfg = opts.langCfg;
  if(langCfg) {
    langFallback.decorate(style, langCfg);
  }

};

var needSprite = fs.existsSync('src/components/Map/style/icons');

var stylePath = 'src/components/Map/style/style.json';
var styleStr = fs.readFileSync(stylePath, 'utf8');

var langCfgPath = 'src/components/Map/style/lang-fallback.json';
console.log(fs.existsSync(langCfgPath))
if(fs.existsSync(langCfgPath)) {
  var langCfgStr = fs.readFileSync(langCfgPath, 'utf8');
  var langCfg = JSON.parse(langCfgStr);
}

var style = JSON.parse(styleStr);
adjustStyle({
  style: style,
  needSprite: needSprite,
  langCfg: langCfg
});
fs.writeFileSync('src/components/Map/mapboxstyle.json', JSON.stringify(style, null, 2), 'utf8');

var style = JSON.parse(styleStr);
adjustStyle({
  style: style,
  needSprite: needSprite
});
fs.writeFileSync('src/components/Map/mapboxstyle-undecorated.json', JSON.stringify(style, null, 2), 'utf8');
