{settings, lib, ...}:
{
  home.file.".config/kitty/vim-mode.lua".text = ''
local api = vim.api
local orig_buf = api.nvim_get_current_buf()
local term_buf = api.nvim_create_buf(false, true)
api.nvim_set_current_buf(term_buf)
vim.bo.scrollback = 100000
local term_chan = api.nvim_open_term(0, {})
api.nvim_chan_send(term_chan, table.concat(api.nvim_buf_get_lines(orig_buf, 0, -1, true), "\r\n"))
vim.fn.chanclose(term_chan)
api.nvim_buf_set_lines(orig_buf, 0, -1, true, api.nvim_buf_get_lines(term_buf, 0, -1, true))
api.nvim_set_current_buf(orig_buf)
api.nvim_buf_delete(term_buf, { force = true })
vim.bo.modified = false
api.nvim_win_set_cursor(0, {api.nvim_buf_line_count(0), 0})
  '';

  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      active_tab_font_style = "bold";
      bold_font = "auto";
      bold_italic_font = "auto";
      confirm_os_window_close = 0;
      cursor_blink_interval = "-1";
      cursor_shape = "underline";
      cursor_stop_blinking_after = 0;
      cursor_underline_thickness = "1.5";
      disable_ligatures = "never";
      editor = "nvim";
      font_family = settings.themeDetails.font;
      font_size = settings.themeDetails.fontSize;
      hide_window_decorations = "titlebar-only";
      inactive_tab_font_style = "normal";
      inactive_text_alpha = "1.0";
      italic_font = "auto";
      placement_strategy = "center";
      resize_in_steps = "yes";
      scrollback_lines = 10000;
      touch_scroll_multiplier = "1.0";
      wheel_scroll_multiplier = "5.0";
      window_margin_width = 0;
      window_padding_width = 15;
      enable_audio_bell = "no";
      cursor_trail = 4;
      scrollback_pager = ''
         nvim +"source /home/fernando/.config/kitty/vim-mode.lua"
      '';
    };
    keybindings = {
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+s" = "paste_from_selection";
      "ctrl+shift+c" = "copy_to_clipboard";
      "shift+insert" = "paste_from_selection";

      "ctrl+shift+up" = "scroll_line_up";
      "ctrl+shift+down" = "scroll_line_down";
      "ctrl+shift+k" = "scroll_line_up";
      "ctrl+shift+j" = "scroll_line_down";
      "ctrl+shift+page_up" = "scroll_page_up";
      "ctrl+shift+page_down" = "scroll_page_down";
      "ctrl+shift+home" = "scroll_home";
      "ctrl+shift+end" = "scroll_end";
      "ctrl+shift+h" = "show_scrollback";

      "ctrl+shift+enter" = "new_window";
      "ctrl+shift+n" = "new_os_window";
      "ctrl+shift+w" = "close_window";
      "ctrl+shift+]" = "next_window";
      "ctrl+shift+[" = "previous_window";
      "ctrl+shift+f" = "move_window_forward";
      "ctrl+shift+b" = "move_window_backward";
      "ctrl+shift+`" = "move_window_to_top";
      "ctrl+shift+1" = "first_window";
      "ctrl+shift+2" = "second_window";
      "ctrl+shift+3" = "third_window";
      "ctrl+shift+4" = "fourth_window";
      "ctrl+shift+5" = "fifth_window";
      "ctrl+shift+6" = "sixth_window";
      "ctrl+shift+7" = "seventh_window";
      "ctrl+shift+8" = "eighth_window";
      "ctrl+shift+9" = "ninth_window";
      "ctrl+shift+0" = "tenth_window";

      "ctrl+shift+right" = "next_tab";
      "ctrl+shift+left" = "previous_tab";
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+q" = "close_tab";
      "ctrl+shift+l" = "next_layout";
      "ctrl+shift+." = "move_tab_forward";
      "ctrl+shift+," = "move_tab_backward";
      "ctrl+shift+alt+t" = "set_tab_title";

      "ctrl+shift+equal" = "increase_font_size";
      "ctrl+shift+minus" = "decrease_font_size";
      "ctrl+shift+backspace" = "restore_font_size";
      "ctrl+shift+f6" = "set_font_size 16.0";
    };
  };
}
