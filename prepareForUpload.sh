#! /bin/sh

mkdir -p regular
rm -rf regular/Library
cp -r Library regular/

libraries=("regular/Library/ Library_mini")
APP=$(basename `dirname $PWD`)
if [ $APP == "Carnets" ]; then
libraries=("regular/Library/ with_scipy/Library Library_mini")
fi

for library in $libraries
do
	# Cleanup install directory from binary files:
	find $library -name __pycache__ -exec rm -rf {} \; >& find.log
	find $library -name \*.pyc -delete
	find $library -name \*.so -delete
	find $library -name \*.a -delete
	find $library -name \*.dylib -delete
	# Also remove MS Windows executables:
	find $library -name \*.exe -delete
	find $library -name \*.dll -delete
	rm -f $library/lib/libpython3.11.dylib
	rm -f $library/bin/python3.11
	rm -f $library/bin/python3
	rm -rf $library/lib/python3.11/lib-dynload
	# Create fake binaries for pip
	touch $library/bin/python3
	touch $library/bin/python3.11
	# change direct_url.json files to have a more meaningful URL:
	find $library -type f -name direct_url.json -exec sed -i bak  "s/file:.*packages/${APP}/g" {} \; -print
	# matplotlib: installed from git repo, so version is "git+https://github.com/", so we fix that:
	echo '{"url": "a-Shell/matplotlib-3.7.0", "dir_info": {}}' > /tmp/mpl.json
	find $library/lib/python3.11/site-packages/matplotlib-3.*.dist-info -name direct_url.json -exec mv /tmp/mpl.json {} \; -print
	find $library -type f -name direct_url.jsonbak -delete
	cp ./build/lib.darwin-arm64-3.11/_sysconfigdata__darwin_darwin.py $library/lib/python3.11/_sysconfigdata__darwin_darwin.py
done

