import { $ } from "bun";

// First two arguments are unnecessary.
const action = Bun.argv[2];
const brightness = async () => Math.round(((await $`brightnessctl get`.text()).replace(/(\r\n|\n|\r)/gm,"")/255)*100);
let value = await brightness();

// TODO: Research other(-r, -u, -h) pamixer flags.
if (action == "up") {
  await $`brightnessctl set 1%+`;
  value = await brightness();
  await $`dunstify -a "BRIGHTNESS" "${value}%" -h int:value:"${value}" -i display-brightness-symbolic -r 2593 -u normal`;
}
else if(action == "down") {
  await $`brightnessctl set 1%-`;
  value = await brightness();
  await $`dunstify -a "BRIGHTNESS" "${value}%" -h int:value:"${value}" -i display-brightness-symbolic -r 2593 -u normal`;
}
else {
  console.log("Current Brightness: " + value + "%");
  await $`dunstify -a "BRIGHTNESS" "${value}%" -h int:value:"${value}" -i display-brightness-symbolic -r 2593 -u normal`;
}
