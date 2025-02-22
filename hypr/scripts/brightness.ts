import { $ } from "bun";

enum Action {
  Increase,
  Decrease,
  SetTo
}

// gets cli arguments and calls appropriate functions
async function main(): Promise<void> {
  const argument: string = Bun.argv[2];
  const argument2: string = Bun.argv[3];
  let action: Action;
  if(argument === "increase" || argument === "i") action = Action.Increase;
  else if(argument === "decrease" || argument === "d") action = Action.Decrease;
  else if(argument === "set" || argument === "s") action = Action.SetTo;

  switch (action) {
    case Action.Increase: 
      await increase();
      break;
    case Action.Decrease: 
      await decrease();
      break;
    case Action.SetTo: 
      await setBrightness(Number(argument2));
      break;
    case Action.Display: 
      break;
  }

  await sendNotification();
}

async function getBrightness(): Promise<number> {
  let brightness = Math.round(((await $`brightnessctl get`.text()).replace(/(\r\n|\n|\r)/gm,"")/255)*100);
  return brightness;
}

async function increase(): Promise<void> {
  await $`brightnessctl set 1%+`;
}

async function decrease(): Promise<void> {
  await $`brightnessctl set 1%-`;
}

async function set(): Promise<void> {
}

async function sendNotification(): Promise<void> {
  console.log("sending");
  let brightness: number = await getBrightness();
  await $`dunstify -a "brightnessctl" "${brightness}%" -h int:brightness:"${brightness}" -i display-brightness-symbolic -r 2593 -u normal`;
  console.log("sent");
}

await main();
