programs.fish = {
  	enable = true;
	plugins = [
		{ name = "done"; src = pkgs.fishPlugins.done.src; }
		{ name = "autopair"; src = pkgs.fishPlugins.autopair.src; }
		{ name = "fzf.fish"; src = pkgs.fishPlugins.fzf-fish.src; }
	];
};