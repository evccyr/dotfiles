{pkgs, ...}: let
  polarity = builtins.getEnv "POLARITY";
in {
  stylix =
    {
      inherit polarity;
      # TODO: Investigate why this option although enabled by default doesn't work without this line.
      cursor.package = pkgs.fuchsia-cursor;
    }
    // (
      if polarity == "dark"
      then {
        image = ../../Pictures/palm-leaves.jpeg;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
        # TODO: Pop & Red cursors show a white block. Not working!
        cursor.name = "Fuchsia-Red";
      }
      else {
        image = ../../Pictures/white-flowers.jpg;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light-soft.yaml";
        cursor.name = "Fuchsia-Pop";
      }
    );
}
