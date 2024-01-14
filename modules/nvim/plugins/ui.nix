{pkgs, ...}:
{
  imports = [
  ];

  programs.nixvim = {
    plugins.bufferline = {
      enable = true;
    };

    plugins.lualine = {
      enable = true;
      iconsEnabled = true;
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" ];
        lualine_c = [ "diagnostics" "filename"];
        lualine_x = [ "filetype"];
        lualine_y = [''
          "progress"
        ''];
      };
    };
  };
}
