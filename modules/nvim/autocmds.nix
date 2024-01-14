{
  programs.nixvim = {
    autoCmd = [
      {
        event = ["vimenter"];
        pattern = ["*"];
        command = "hi Normal guibg=NONE ctermbg=NONE";
      }
    ];
  };
}
