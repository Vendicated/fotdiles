if [ -n "$DISCORD_TOKEN" ]
then
  discord_invite() {
    curl -sS https://discord.com/api/invite/$(basename "$1") | jq .
  }
  discord_get() {
    route="${1:?Please specify a route}"
    curl -sS https://discord.com/api/v9/"$route" -H "authorization: Bot $DISCORD_TOKEN" | jq .
  }
  discord_post() {
    route="${1:?Please specify a route}"
    body="$2"
    curl -sS -XPOST https://discord.com/api/v9/"$route" -H "authorization: Bot $DISCORD_TOKEN" -d "$body" |  jq .
  }
  discord_whois() {
    id=${1:?Please specify an ID to lookup}
    discord_get users/$id
  }
  discord_token_whois() {
    case "${1:?Please specify a token to lookup}" in
      mfa.*) echo "2FA Token, cannot retrieve info." ;;
      *) discord_whois "$(printf "${1%%.*}" | base64 --decode)" ;;
    esac
  }
fi

discord_revoke_token() {
  token="${1:?Please specify a token to revoke}" 
  url="$(printf "$token" | gh gist create --public --filename token.txt)" 
  echo "Gist created. Sleeping for 5 seconds..."
  sleep 5
  gh gist delete "$url"
  echo Gist deleted
}
