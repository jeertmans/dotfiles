# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Restoring tmux sessions
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

set -g @continuum-restore 'on'

# Enabling mouse scrolling
set -g mouse on


# Advice from nvim:checkhealth
set-option -sg escape-time 10
set-option -g focus-events on
set-option -sa terminal-overrides ',screen-256color:RGB'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'github_username/plugin_name#branch'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'

# Set new panes to open in current directory
bind c new-window -c "#{pane_current_path}"
bind '"' split-window -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"

# Run nested sessions
# https://github.com/aleclearmind/nested-tmux
#
# Colors
#
active_window_bg=colour34
inactive_window_bg=colour102
bar_bg=colour237
bar_fg=colour255

#
# General settings
#
set -g default-terminal screen.xterm-256color
set -g status-right ''
set -g status-left ''
set -g history-limit 100000

#
# Configure prefix
#
unbind C-b
set -g prefix C-a

#
# Prefixed commands
#

# Create a new window (Ctrl + A, Ctrl + c)
bind C-c new-window

# Switch to last window (Ctrl + A, Ctrl + A)
bind C-a last-window

# Rename current window (Ctrl + A, A)
bind A  rename-window '' \; \
        command-prompt -I "#W" "rename-window -- '%%'"

# Enable search mode
bind -T copy-mode -n / command-prompt -i -I "#{pane_search_string}" -p "(search down)" "send -X search-forward-incremental \"%%%\""

#
# Non-prefixed commands
#

# Go to next window (Alt + Right)
bind -n M-right next

# Go to previous window (Alt + Left)
bind -n M-left  prev

# Create new window (Ctrl + t)
bind -n C-t new-window

# Switch to inner tmux (Alt + Up)
bind -n M-up send-keys M-F12

# Switch to outer tmux (Alt + Down)
bind -n M-down source-file ~/.tmux.conf.d/nested-tmux/inactive-row.conf \; \
               run-shell 'tmux -L $TMUX_PARENT source-file ~/.tmux.conf.d/nested-tmux/active-row.conf' \; \
               run-shell 'tmux -L $TMUX_PARENT set -g window-status-current-style bg=$active_window_bg'

# Handler for becoming active (Alt + F12, don't use directly)
bind -n M-F12 run-shell 'tmux -L $TMUX_PARENT source-file ~/.tmux.conf.d/nested-tmux/inactive-row.conf' \; \
              source-file ~/.tmux.conf.d/nested-tmux/active-row.conf \; \
              set -g window-status-current-style bg=$active_window_bg

# Handler for closed window: enable outer terminal
set-hook -g client-detached "run-shell 'tmux -L $TMUX_PARENT source-file ~/.tmux.conf.d/nested-tmux/active-row.conf && tmux -L $TMUX_PARENT set -g window-status-current-style bg=$active_window_bg'"

#
# Appearance
#
set -g status-style bg=$bar_bg
setw -g window-status-style fg=$bar_fg
setw -g window-status-current-format ' #I #W '
setw -g window-status-format ' #I #W '
setw -g window-status-current-style bg=$active_window_bg

# If we're the root tmux, unbind M-down
if-shell 'test -z "$TMUX_PARENT"' 'bind -n M-down send-keys ""' ''

# When a new session is created unbind the parent
if-shell 'test -z "$TMUX_PARENT"' '' 'run-shell "tmux -L $TMUX_PARENT source-file ~/.tmux.conf.d/nested-tmux/inactive-row.conf"'
