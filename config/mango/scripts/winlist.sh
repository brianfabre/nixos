#!/bin/sh
# List apps on the active tag (monocle only), focused app in brackets
mon="HDMI-A-2"

tags=$(mmsg get tags "$mon")
clients=$(mmsg get all-clients)

jq -rn --argjson t "$tags" --argjson c "$clients" '
  # Friendlier names for app IDs; anything not listed shows its raw app ID
  def pretty: {
    "foot": "terminal",
    "zen": "zen",
    "Mullvad Browser": "mullvad",
    "blueman-manager": "bluetooth"
  }[.] // .;

  $t.active_tags as $active
  | select([$t.tags[] | select(.is_active) | .layout] | any(. == "M"))
  | [ $c.clients[]
      | select(.monitor == $t.monitor)
      | select(any(.tags[]; IN($active[])))
      | select((.is_minimized or .is_scratchpad or .is_namedscratchpad) | not)
      | (.appid | pretty) as $name
      | if .is_focused then "[\($name)]" else $name end ]
  | select(length > 1)
  | join(" · ")
'
