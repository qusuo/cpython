directory=build/lib.darwin-arm64-3.9/Frameworks
for library in libgfortran
do
	framework="${library%.*}"
	echo $framework
	mkdir -p  $directory/$framework.framework
	libraryFile=Frameworks_iphoneos/lib/$library.dylib
	cp $libraryFile $directory/$framework.framework/$framework
	cp plists/basic_Info.plist $directory/$framework.framework/Info.plist
	plutil -replace CFBundleExecutable -string $framework $directory/$framework.framework/Info.plist
	plutil -replace CFBundleName -string $framework $directory/$framework.framework/Info.plist
	# underscore is not allowed in CFBundleIdentifier:
	signature=${framework//_/-}
	plutil -replace CFBundleIdentifier -string Nicolas-Holzschuch.$signature  $directory/$framework.framework/Info.plist
	# change framework id: 
	install_name_tool -id @rpath/$framework.framework/$framework  $directory/$framework.framework/$framework
	install_name_tool -change /usr/local/aarch64-apple-darwin20/lib/libgcc_s.2.dylib @rpath/libgcc_s.framework/libgcc_s $directory/$framework.framework/$framework
	plutil -replace DTPlatformName -string "iphoneos" $directory/$framework.framework/Info.plist
	plutil -replace DTSDKName -string "iphoneos" $directory/$framework.framework/Info.plist
	plutil -replace DTPlatformVersion -string "14.0" $directory/$framework.framework/Info.plist
	plutil -replace MinimumOSVersion -string "14.0" $directory/$framework.framework/Info.plist
	# Create a single-architecture XCFramework:
	rm -rf XcFrameworks/$framework.xcframework
	xcodebuild -create-xcframework -framework build/lib.darwin-arm64-3.9/Frameworks/$framework.framework -output  XcFrameworks/$framework.xcframework
done 


