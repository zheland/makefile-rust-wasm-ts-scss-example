const fs = require("fs");
const rcs = require("rcs-core");

const bundle_path = process.argv[2];
const mapping_path = process.argv[3];

rcs.fillLibraries(fs.readFileSync(bundle_path, "utf8"));
let data = JSON.stringify(rcs.mapping.generate());
fs.writeFileSync(mapping_path, data);
