{pkgs, ...}:{
 imports = [
   ./coding/cmp.nix
 ];

 programs.nixvim = {
   extraPlugins = with pkgs.vimPlugins; [
     friendly-snippets
     nvim-web-devicons
   ];
   
   plugins = {
	luasnip = {
	  enable = true;
	};
	nvim-autopairs = {
	  enable = true;
	  disabledFiletypes = ["TelescipePromt" "vim"];
	};
   };
 };
}
