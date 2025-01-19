// #! /usr/bin/env nix-shell
// #! nix-shell -i "bun run" -p bun
// TODO: Make a ticket bun github
 
import { $ } from "bun";

// First two arguments are unnecessary.
const action = Bun.argv[2];
const volume = async () => await $`wpctl get-volume @DEFAULT_AUDIO_SINK@`.text();
let value: string = await volume();
console.log(value);

/* const volume = async () => (await $`pamixer --get-volume`.text()).replace(/(\r\n|\n|\r)/gm,"");
let value.split(' ')[1]*100;

// TODO: Research other(-r, -u, -h) pamixer flags.
if (action == "up") {
  await $`wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 0`;
  await $`wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-`;
  value = await volume();
  await $`dunstify -a "VOLUME" "${value}%" -h int:value:"${value}" -i audio-volume-high-symbolic -r 2593 -u normal`;
}
else if(action == "down") {
  await $`pamixer --unmute`;
  await $`pamixer -d 3`;
  value = await volume();
  await $`dunstify -a "VOLUME" "${value}%" -h int:value:"${value}" -i audio-volume-low-symbolic -r 2593 -u normal`;
}
else {
  await $`pamixer --toggle-mute`;
  let status = "UNMUTED";
  let icon = "audio-volume-high-symbolic";
  if (await $`pamixer --get-mute`.text() == "true\n") {
     status = "MUTED";
     icon = "audio-volume-muted-symbolic";
  }
  console.log("Current Volume: " + value + "%");
  await $`dunstify -a "VOLUME" "${status}" -h int:value:"${value}" -i "${icon}" -r 2593 -u normal`;
}*/
