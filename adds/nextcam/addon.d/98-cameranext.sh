#!/sbin/sh
# 
# /system/addon.d/98-cameranext.sh
# During a CM13 upgrade, this script backs up CameraNext apk in system/priv-app,
# /system is formatted and reinstalled, then the file is restored.
#

. /tmp/backuptool.functions

list_files() {
cat <<EOF
priv-app/CameraNextModv7/CameraNextModv7.apk
priv-app/CameraNext/lib/arm/libjni_tinyplanet_next.so
priv-app/CameraNext/lib/arm/libjni_mosaic_next.so
priv-app/GalleryNext/GalleryNext.apk
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
