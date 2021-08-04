if [ -n "$DISCORD_TOKEN" ]
then
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
fi

