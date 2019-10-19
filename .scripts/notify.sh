#!/usr/bin/env bash


usage() {
  echo
  echo "Usage: $0"
  echo "  notify.sh (-h | --help): Display this help message"
  echo "  notify.sh (-n | --notification) <notification text>"
  echo "  notify.sh (-t | --title) <notifiaction title>"
  echo "  notify.sh (-s | --subtitle) <notification subtitle>"
  echo
  echo "If -t or --title is not passed, the title defaults to \"Terminal\""
  echo "Subtitle is optional (If -s or --subtitle is not passed,"
  echo "no subtitle is displayed)"
  echo
  exit 1
}


if [ "$#" == 0 ]; then
  echo "Expected text (notify.sh -n <text>)"
  usage
  exit 1
fi

while [[ "$#" -gt 0 ]]; do
  opt="$1"
  case "$opt" in
    -h|--help)
      usage
      ;;
    -n|--notification)
      NTF="$2"
      shift
      shift
      ;;
    -t|--title)
      TITLE="$2"
      shift
      shift
      ;;
    -s|--subtitle)
      SUBTITLE="$2"
      shift
      shift
      ;;
    :)
      echo "-${opt} requires an argument"
      echo "If you don't want any text to display, pass an empty string ('')"
      exit 1
  esac
done

notify() {
  if [[ "${TITLE}" == '' ]]; then
    TITLE="Terminal"
  fi

  if [[ "${SUBTITLE}" == '' ]]; then
    /usr/bin/osascript -e \
      "display notification \"${NTF}\" with title \"${TITLE}\""
  else
    /usr/bin/osascript -e \
      "display notification \"${NTF}\" with title \"${TITLE}\" subtitle \"${SUBTITLE}\""
  fi
}

#notify_test() {
#  if [[ ${TITLE} == '' ]]; then
#    TITLE="Terminal"
#  fi
#  echo "$NTF $TITLE"
#}

notify
