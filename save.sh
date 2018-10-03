echo 'atom'
apm list --installed --bare | grep '^[^@]\+' -o > atom/packages.txt
cp ~/.atom/config.cson atom/config.cson
cp ~/.atom/styles.less atom/styles.less

echo 'hyper'
cp ~/.hyper.js hyper.js