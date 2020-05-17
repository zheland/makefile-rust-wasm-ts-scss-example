const assert = require("assert").strict;
const path = require("path");
const fs = require("fs");
const rcs = require("rcs-core");

const mapping_path = process.argv[2];
const source_path = process.argv[3];
const target_path = process.argv[4];

rcs.mapping.load(JSON.parse(fs.readFileSync(mapping_path)));
let content = fs.readFileSync(source_path, "utf8");
let extension = path.extname(source_path);

let fn = ({
    ".html": rcs.replace.html,
    ".css": rcs.replace.css,
    ".js": rcs.replace.js,
})[extension];
assert(fn, "File \"" + source_path + "\" has extension \""
    + extension + "\" which is not supported");

const renamed = fn(content);
fs.writeFileSync(target_path, renamed);
