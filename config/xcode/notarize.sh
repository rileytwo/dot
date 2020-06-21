EXPORT_PATH="$TEMP_DIR/EXPORT"

APP_PATH="$EXPORT_PATH/$PRODUCT_NAME.app"
DMG_PATH="$EXPORT_PATH/$PRODUCT_NAME.dmg"
ZIP_PATH="$EXPORT_PATH/$PRODUCT_NAME.zip"

/usr/bin/xcodebuild \
    -exportArchive \
    -archivePath "$ARCHIVE_PATH" \
    -exportOptionsPlist "$SRCROOT/ExportOptions.plist" \
    -exportPath "$EXPORT_PATH"

/usr/bin/ditto -c -k --keepParent "$APP_PATH" "$ZIP_PATH"

/usr/bin/open "$EXPORT_PATH"
