{
  programs.nixvim = {
    keymaps = [
      {
        action = "<cmd>confirm q<CR>";
        key = "<leader>q";
        options = {
          desc = "Close forced";
        };
      }
      {
        action ="<cmd>w!<CR>";
        key = "<leader>w";
        options = {
          desc = "save file";
        };
        mode = ["n"];
      }
      {
        action = "<cmd>bd<CR>";
        key = "<leader>c";
        options = {
          desc = "Close Buffer";
        };
      }
      {
        action = "<cmd>bp<CR>";
        key = "<leader>bb";
        options = {
          desc = "Prev Buffer";
        };
      }
      {
        action = "<cmd>bn<CR>";
        key = "<leader>bn";
        options = {
          desc = "Next Buffer";
        };
      }
      {
        action = "<C-d>zz";
        key = "<C-d>";
        options = {
          desc = "Keep cursor in middle when jumping";
        };
        mode = [
          "n"
        ];
      }
      {
        action = "<C-u>zz";
        key = "<C-u>";
        options = {
          desc = "Keep cursor in middle when jumping";
        };
        mode = [
          "n"
        ];
      }
      {
        action = "mzJ`z";
        key = "J";
        options = {
          desc = "Combine line into one";
        };
        mode = [
          "n"
        ];
      }
      {
        action = "nzzzv";
        key = "n";
        options = {
          desc = "Keep cursor in middle when searching";
        };
        mode = [
          "n"
        ];
      }
      {
        action = "Nzzzv";
        key = "N";
        options = {
          desc = "Keep cursor in middle when searching";
        };
        mode = [
          "n"
        ];
      }
    ];
  };
}
