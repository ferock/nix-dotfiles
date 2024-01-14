{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.editors.nvim;
in {
  imports = [
  	./keymaps.nix
	./options.nix
	./autocmds.nix

	./plugins/editors.nix
	./plugins/coding.nix
	./plugins/colorscheme.nix
	./plugins/ui.nix
	./plugins/lsp.nix
	./plugins/treesitter.nix

	./plugins/lang/python.nix
	./plugins/lang/go.nix
	./plugins/lang/json.nix
	./plugins/lang/css.nix
	./plugins/lang/lua.nix
	./plugins/lang/nix.nix
  ];

  options.modules.editors.nvim = {
	enable = mkEnableOption "enable neovim editor";
  };

  config = 
    mkIf
    cfg.enable
    {
      programs.nixvim = {
        enable = true;
        extraPlugins = with pkgs.vimPlugins; [plenary-nvim];
        package = pkgs.neovim;
      };
    };
}
