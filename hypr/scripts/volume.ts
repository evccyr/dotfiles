// #! /usr/bin/env nix-shell
// #! nix-shell -i "bun run" -p bun
// TODO: Make a ticket bun github
 
import { $ } from "bun";

enum Action {
  Increase,
  Decrease,
  Mute,
  Unmute,
  Display,
  SetTo
}

/*
wpctl can set volume above 100%
Checks for absurd volume levels and sets the volume to 50%
*/
async function fixVolumeRange(): Promise<number> {
  let vol: number = getVolume();
  if(vol < 0 || vol > 100) await setVolume(50);
  return 50;
}

// Sets the volume to the provided value if provided
async function setVolume(value: number): Promise<number> {
  if(value) {
    await $`wpctl set-volume @DEFAULT_AUDIO_SINK@ ${value}%`;
  }
  return getVolume();
}

// Mutes audio
async function mute(): Promise<number> {
  await $`wpctl set-mute @DEFAULT_AUDIO_SINK@ 1`;
  return await getVolume();
}

// unmutes audio
async function unmute(): Promise<number> {
  await $`wpctl set-mute @DEFAULT_AUDIO_SINK@ 0`;
  return await getVolume();
}

// wpctl get-volume returns the volume level as a value between 0 and 1
// This function converts it to a range from 0 to 100
async function getVolume(): Promise<number> {
  let volume: string = await $`wpctl get-volume @DEFAULT_AUDIO_SINK@`.text();
  let parsedVolume: number = Number(volume.split(' ')[1])*100;
  return parsedVolume;
}

// Increases volume and returns the current volume & Unmutes audio
async function increaseVolume(value: number = 3): Promise<number> {
  await $`wpctl set-volume @DEFAULT_AUDIO_SINK@ ${value}%+`;
  await unmute();
  return await getVolume();
}

// Decreases volume and returns the current volume
async function decreaseVolume(value: number = 3): Promise<number> {
  await $`wpctl set-volume @DEFAULT_AUDIO_SINK@ ${value}%-`;
  return await getVolume();
}

async function sendNotification(type: Action): Promise<void> {
  let volume: number = await getVolume();

  switch (type) {
    case Action.Increase: 
      await $`dunstify -a "VOLUME" "${volume}%" -h int:volume:"${volume}" -i audio-volume-high-symbolic -r 2593 -u normal`;
      break;
    case Action.Decrease: 
      await $`dunstify -a "VOLUME" "${volume}%" -h int:volume:"${volume}" -i audio-volume-low-symbolic -r 2593 -u normal`;
      break;
    case Action.Set: 
      await $`dunstify -a "VOLUME" "${volume}%" -h int:volume:"${volume}" -i audio-volume-high-symbolic -r 2593 -u normal`;
      break;
    case Action.Mute: 
      await $`dunstify -a "VOLUME" "${volume}%" -h int:volume:"${volume}" -i audio-volume-high-symbolic -r 2593 -u normal`;
      break;
    case Action.Unmute: 
      await $`dunstify -a "VOLUME" "${volume}%" -h int:volume:"${volume}" -i audio-volume-muted-symbolic -r 2593 -u normal`;
      break;
    case Action.Display: 
      await $`dunstify -a "VOLUME" "${volume}%" -h int:volume:"${volume}" -i audio-volume-high-symbolic -r 2593 -u normal`;
      break;
  }
}

// gets cli arguments and calls appropriate functions
async function main() {
  const argument: string = Bun.argv[2];
  const argument2: string = Bun.argv[3];
  let action: Action;
  if(argument == "increase") action = Action.Increase;
  else if(argument == "decrease") action = Action.Decrease;
  else if(argument == "mute") action = Action.Mute;
  else if(argument == "unmute") action = Action.Unmute;
  else if(argument == "set") action = Action.SetTo;

  await fixVolumeRange();
  
  switch (action) {
    case Action.Increase: 
      increaseVolume();
      break;
    case Action.Decrease: 
      decreaseVolume();
      break;
    case Action.SetTo: 
      setVolume(Number(argument2));
      break;
    case Action.Mute: 
      mute();
      break;
    case Action.Unmute: 
      unmute();
      break;
    case Action.Display: 
      break;
  }

    await sendNotification(action);
}

await main();

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
  if (await $`pamixer --get-mute`.text() == "true\n") {
     status = "MUTED";
  }
  console.log("Current Volume: " + value + "%");
  await $`dunstify -a "VOLUME" "${status}" -h int:value:"${value}" -i "${icon}" -r 2593 -u normal`;
}
*/
