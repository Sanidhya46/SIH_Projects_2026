const fs = require('fs');
const content = fs.readFileSync('Saurya_Rakshak/index.html', 'utf8');
const lines = content.split(/\r?\n/);
lines.forEach((l, idx) => {
  if (l.includes('id="view-simulation"')) {
    console.log('Found at line ' + (idx + 1));
    for (let k = idx - 2; k <= idx + 45 && k < lines.length; k++) {
      console.log((k+1) + ': ' + lines[k]);
    }
  }
});
