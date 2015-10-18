# Setup the debug function 

if [ -n "${DEBUG:+1}" ]; then
  function debug(){
    local message=$1
    shift 
    for arg in "$@"; do
      message="$message [$arg]"
    done
    echo "DEBUG: $message"
  }
  debug "debug turned on" "$DEBUG"
else
  function debug(){ true; }
fi

# Take mock args from the front for testing
# As soon as we meet an option we don't know, go on to 
# doing the mock

mock_rc=0
mock_sleep=0.01

while true; do
  debug "args" "$1" "$@"
  case "$1" in
    "--mock-rc") shift; mock_rc=$1; shift;;
    "--mock-sleep") shift; mock_sleep=$1; shift;;
    *) break;;
  esac
done
