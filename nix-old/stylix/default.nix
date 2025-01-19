{pkgs, ...}: {
  stylix = {
    cursor.package = pkgs.fuchsia-cursor;
    image = ../../Pictures/gruv-room.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light-medium.yaml";
    cursor.name = "Fuchsia";
    polarity = "light";
  };
}
