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

  switch (action) {
    case Action.Increase: 
      await increaseVolume();
      break;
    case Action.Decrease: 
      await decreaseVolume();
      break;
    case Action.SetTo: 
      await setVolume(Number(argument2));
      break;
    case Action.Mute: 
      await mute();
      break;
    case Action.Unmute: 
      await unmute();
      break;
    case Action.Display: 
      break;
  }

  await sendNotification(action);
}

// Sets the volume to the provided value if provided
// NOTE: wpctl can set volume beyond 100%
async function setVolume(value: number): Promise<number> {
  value = Math.trunc(value);
  if(value < 0) await setVolume(0);
  else if(value > 100) await setVolume(100);
  else await $`wpctl set-volume @DEFAULT_AUDIO_SINK@ ${value}%`;
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
  let parsedVolume: number = Math.trunc(Number(volume.split(' ')[1])*100);
  return parsedVolume;
}

// Increases volume and returns the current volume & Unmutes audio
async function increaseVolume(value: number = 3): Promise<number> {
  let volume: number = await getVolume();
  await setVolume(volume + value);
  await unmute();
  return await getVolume();
}

// Decreases volume and returns the current volume
async function decreaseVolume(value: number = 3): Promise<number> {
  let volume: number = await getVolume();
  await setVolume(volume - value);
  return await getVolume();
}

async function sendNotification(type: Action): Promise<void> {
  let volume: number = await getVolume();

  switch (type) {
    case Action.Increase: 
      await $`dunstify -a "wpctl" "${volume}%" -h int:volume:"${volume}" -r 2593 -u normal`;
      break;
    case Action.Decrease: 
      await $`dunstify -a "wpctl" "${volume}%" -h int:volume:"${volume}" -r 2593 -u normal`;
      break;
    case Action.Set: 
      await $`dunstify -a "wpctl" "${volume}%" -h int:volume:"${volume}" -r 2593 -u normal`;
      break;
    case Action.Mute: 
      await $`dunstify -a "wpctl" "MUTED ${volume}%" -h int:volume:"${volume}" -r 2593 -u normal`;
      break;
    case Action.Unmute: 
      await $`dunstify -a "wpctl" "${volume}%" -h int:volume:"${volume}" -r 2593 -u normal`;
      break;
    case Action.Display: 
      await $`dunstify -a "wpctl" "${volume}%" -h int:volume:"${volume}" -r 2593 -u normal`;
      break;
  }
}

await main();
