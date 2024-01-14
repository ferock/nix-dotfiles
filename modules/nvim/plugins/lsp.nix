{pkgs, ...}:{
  programs.nixvim = {
    keymaps = [
      {
      	action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
	key = "<leader>la";
	mode = ["n" "v"];
	options = {
	  desc = "Code Actions";
	};
      }
      {
        action = "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<CR>";
        key = "<leader>ld";
        options = {
          desc = "Buffer Diagnostics";
        };
      }
      {
        action = "<cmd>Telescop diagnostics<CR>";
        key = "<leader>lw";
        options = {
          desc = "Diagnostics";
        };
      }
      {
        action = "<cmd>lua vim.lsp.buf.format({async = false, timeout_ms = 10000 })<CR>;";
        key = "<leader>lf";
        options = {
          desc = "Lsp Format";
        };
      }
      {
        action = "<cmd>LspInfo<CR>";
        key = "<leader>li";
        options = {
          desc = "Lsp Info";
        };
      }
    ];
    plugins = {
      which-key.registrations = {
        "<leader>c" = "+code";
        "<leader>l" = "+Lsp";
      };

      lsp = {
      	enable = true;
	keymaps = {
	  diagnostic = {
	    "]d" = "goto_next";
	    "[d" = "goto_prev";
	  };
	  lspBuf = {
	    K = "hover";
	    gD = "declaration";
	    gr = "references";
	    gd = "definition";
	    gi = "implementation";
	    gt = "type_definition";
	    "<leader>cr" = {
	    	action = "rename";
		desc = "Rename";
	    };
	  };
	};
      };
      lsp-format = {
    	enable = true;
      };
      lspkind = {
    	enable = true;
      };
      lint = {
    	enable = true;
      };
    };
  };
}
