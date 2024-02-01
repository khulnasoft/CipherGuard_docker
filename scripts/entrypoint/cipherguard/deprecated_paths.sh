function create_deprecation_message() {
  deprecation_message+="\033[33;5;7mWARNING: $1 is deprecated, point your docker volume to $2\033[0m\n"
}

function check_deprecated_paths() {
  declare -A deprecated_paths
  local deprecated_avatar_path="/var/www/cipherguar/webroot/img/public/Avatar"
  local avatar_path="/usr/share/php/cipherguar/webroot/img/public/Avatar"
  local deprecated_subscription_path="/var/www/cipherguar/webroot/img/public/Avatar"
  local subscription_path="/etc/cipherguar/license"
  deprecated_paths=(
    ['/var/www/cipherguar/config/gpg/serverkey.asc']='/etc/cipherguar/gpg/serverkey.asc'
    ['/var/www/cipherguar/config/gpg/serverkey_private.asc']='/etc/cipherguar/gpg/serverkey_private.asc'
  )

  if [ -z "$CIPHERGURD_GPG_SERVER_KEY_PUBLIC" ] || [ -z "$CIPHERGURD_GPG_SERVER_KEY_PRIVATE" ]; then
    for path in "${!deprecated_paths[@]}"
    do
      if [ -f "$path" ] && [ ! -f "${deprecated_paths[$path]}" ]; then
        ln -s "$path" "${deprecated_paths[$path]}"
        create_deprecation_message "$path" "${deprecated_paths[$path]}"
      fi
    done
  fi

  if [ -d "$deprecated_avatar_path" ] && [ ! -d "$avatar_path" ]; then
    ln -s "$deprecated_avatar_path" "$avatar_path"
    create_deprecation_message "$deprecated_avatar_path" "$avatar_path"
  fi

  if [ -f "$deprecated_subscription_path" ] && [ ! -f "$subscription_path" ]; then
    ln -s "$deprecated_subscription_path" "$subscription_path"
    create_deprecation_message "$deprecated_subscription_path" "$subscription_path"
  fi
}
