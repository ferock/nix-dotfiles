{
  programs.nixvim = {

	colorschemes.catppuccin= {
		enable = true;
                integrations= {
                  indent_blankline = {
                    enabled = true;
                  };
                  native_lsp={
                    enabled = true;
                  };
                };
	};
  };
}
