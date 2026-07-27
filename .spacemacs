;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(nginx
     asciidoc
     lua
     (sql :variables sql-backend 'lsp)
     csv
     windows-scripts
     ruby
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     emacs-lisp
     git
     helm
     lsp
     markdown
     rust
     ess
     ;; multiple-cursors
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     treemacs
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'vterm)
     (spell-checking :variables spell-checking-enable-by-default nil)
     (syntax-checking :variables
                      syntax-checking-enable-tooltips nil)
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-diff-side 'left)
     (python :variables
             python-formatter 'ruff
             python-backend 'lsp
             python-test-runner 'pytest
             pyvenv-tracking-mode nil
                                        ;auto-set-local-pyvenv-virtualenv nil
                                        ;python-auto-set-local-pyenv-version nil
             )
     javascript
     typescript
     yaml
     shell-scripts
     (go :variables gofmt-command "goimports")
     c-c++
     (html :variables html-enable-lsp nil)
     org
     docker
     deft
     dap
     ipython-notebook
     spacemacs-purpose
     dash
     nixos
     (languagetool :variables
                   langtool-language-tool-jar "/snap/languagetool/current/usr/bin/languagetool-commandline.jar"

                   langtool-default-language "en-US")
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      switch-window
                                      helm-dash
                                      outline-magic
                                      remark-mode
                                      dictionary
                                      discover-my-major
                                      pandoc-mode
                                      beginend
                                      python-docstring
                                      python-pytest
                                      lsp-pyright
                                      traadpa
                                      writeroom-mode
                                      blacken
                                      editorconfig
                                      graphviz-dot-mode
                                      separedit
                                      so-long
                                      cython-mode
                                      direnv
                                      just-mode
                                      nix-update
                                      quarto-mode
                                      vundo
                                      lsp-ltex-plus
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(rainbow-delimiters)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Atkinson Hyperlegible Mono"
                               :weight normal
                               :width normal
                               :size 18
                               :powerline-scale 1.1
                               )

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "ack" "grep")

   ;; The backend used for undo/redo functionality. Possible values are
   ;; `undo-fu', `undo-redo' and `undo-tree' see also `evil-undo-system'.
   ;; Note that saved undo history does not get transferred when changing
   ;; your undo system. The default is currently `undo-fu' as `undo-tree'
   ;; is not maintained anymore and `undo-redo' is very basic."
   dotspacemacs-undo-system 'undo-fu

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

                                        ; difftastic integration from https://tsdh.org/posts/2022-08-01-difftastic-diffing-with-magit.html
(defun th/magit--with-difftastic (buffer command)
  "Run COMMAND with GIT_EXTERNAL_DIFF=difft then show result in BUFFER."
  (let ((process-environment
         (cons (concat "GIT_EXTERNAL_DIFF=difft --width="
                       (number-to-string (frame-width)))
               process-environment)))
    ;; Clear the result buffer (we might regenerate a diff, e.g., for
    ;; the current changes in our working directory).
    (with-current-buffer buffer
      (setq buffer-read-only nil)
      (erase-buffer))
    ;; Now spawn a process calling the git COMMAND.
    (make-process
     :name (buffer-name buffer)
     :buffer buffer
     :command command
     ;; Don't query for running processes when emacs is quit.
     :noquery t
     ;; Show the result buffer once the process has finished.
     :sentinel (lambda (proc event)
                 (when (eq (process-status proc) 'exit)
                   (with-current-buffer (process-buffer proc)
                     (goto-char (point-min))
                     (ansi-color-apply-on-region (point-min) (point-max))
                     (setq buffer-read-only t)
                     (view-mode)
                     (end-of-line)
                     ;; difftastic diffs are usually 2-column side-by-side,
                     ;; so ensure our window is wide enough.
                     (let ((width (current-column)))
                       (while (zerop (forward-line 1))
                         (end-of-line)
                         (setq width (max (current-column) width)))
                       ;; Add column size of fringes
                       (setq width (+ width
                                      (fringe-columns 'left)
                                      (fringe-columns 'right)))
                       (goto-char (point-min))
                       (pop-to-buffer
                        (current-buffer)
                        `(;; If the buffer is that wide that splitting the frame in
                          ;; two side-by-side windows would result in less than
                          ;; 80 columns left, ensure it's shown at the bottom.
                          ,(when (> 80 (- (frame-width) width))
                             #'display-buffer-at-bottom)
                          (window-width
                           . ,(min width (frame-width))))))))))))

(defun th/magit-show-with-difftastic (rev)
  "Show the result of \"git show REV\" with GIT_EXTERNAL_DIFF=difft."
  (interactive
   (list (or
          ;; If REV is given, just use it.
          (when (boundp 'rev) rev)
          ;; If not invoked with prefix arg, try to guess the REV from
          ;; point's position.
          (and (not current-prefix-arg)
               (or (magit-thing-at-point 'git-revision t)
                   (magit-branch-or-commit-at-point)))
          ;; Otherwise, query the user.
          (magit-read-branch-or-commit "Revision"))))
  (if (not rev)
      (error "No revision specified")
    (th/magit--with-difftastic
     (get-buffer-create (concat "*git show difftastic " rev "*"))
     (list "git" "--no-pager" "show" "--ext-diff" rev))))

(defun th/magit-diff-with-difftastic (arg)
  "Show the result of \"git diff ARG\" with GIT_EXTERNAL_DIFF=difft."
  (interactive
   (list (or
          ;; If RANGE is given, just use it.
          (when (boundp 'range) range)
          ;; If prefix arg is given, query the user.
          (and current-prefix-arg
               (magit-diff-read-range-or-commit "Range"))
          ;; Otherwise, auto-guess based on position of point, e.g., based on
          ;; if we are in the Staged or Unstaged section.
          (pcase (magit-diff--dwim)
            ('unmerged (error "unmerged is not yet implemented"))
            ('unstaged nil)
            ('staged "--cached")
            (`(stash . ,value) (error "stash is not yet implemented"))
            (`(commit . ,value) (format "%s^..%s" value value))
            ((and range (pred stringp)) range)
            (_ (magit-diff-read-range-or-commit "Range/Commit"))))))
  (let ((name (concat "*git diff difftastic"
                      (if arg (concat " " arg) "")
                      "*")))
    (th/magit--with-difftastic
     (get-buffer-create name)
     `("git" "--no-pager" "diff" "--ext-diff" ,@(when arg (list arg))))))


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
    ;;; GENERAL ;;;
  (server-start)
  (setq-default line-spacing 2)

                                        ; highlight matching parenthesis:
  (setq show-paren-delay 0)
  (show-paren-mode 1)

  ;; speed up linum-relative
  (setq linum-relative-backend 'display-line-numbers-mode)

  ;; After switching projects in projectile by default we want magit-status
  (setq projectile-switch-project-action 'magit-status)

                                        ; enable switch-window
  (global-set-key (kbd "C-x o") 'switch-window)

                                        ; nicer buffer switching
                                        ;(ivy-set-display-transformer 'ivy-switch-buffer 'ivy-rich-switch-buffer-transformer)


  (define-key prog-mode-map        (kbd "C-c '") #'separedit)
  (define-key minibuffer-local-map (kbd "C-c '") #'separedit)
  (define-key help-mode-map        (kbd "C-c '") #'separedit)

  ;; Default major-mode for edit buffer
  ;; can also be other mode e.g. ‘org-mode’.
  (setq separedit-default-mode 'markdown-mode)

                                        ; Rust
                                        ; TODO https://veykril.github.io/posts/semantic-unsafe/
  (setq rust-format-on-save 't)
                                        ;(setq rustic-format-on-save 't)
                                        ;(setq rustic-format-on-save-method 'rustic-cargo-fmt)
                                        ;(setq lsp-ui-doc-enable nil)
                                        ;(setq-default lsp-rust-analyzer-cargo-watch-command "check")
  (setq lsp-enable-file-watchers nil)
  (setq-default lsp-format-buffer-on-save 't)
  (setq-default lsp-format-buffer-on-save-list '(rustic-mode))
  (setq-default lsp-rust-analyzer-cargo-auto-reload nil)
  (setq-default lsp-rust-analyzer-cargo-extra-env #s(hash-table data ("CARGO_TARGET_DIR" "target/analyzer")))
  (setq-default lsp-rust-analyzer-cargo-watch-args ["--target-dir=target/analyzer"])
                                        ;(setq-default lsp-rust-analyzer-cargo-override-command ["cargo" "check" "--message=format=json" "--target-dir=target/analyzer"])
                                        ;(require 'rust-mode)
                                        ;(define-key rust-mode-map (kbd "M-RET h b") 'lsp-rust-analyzer-open-external-docs)
                                        ;(define-key rust-mode-map (kbd "M-m m h b") 'lsp-rust-analyzer-open-external-docs)
  (setq lsp-lens-enable 't)
                                        ;(setq lsp-enable-semantic-highlighting 't)
                                        ;(setq lsp-semantic-tokens-enable 't)
                                        ;(add-to-list 'lsp-semantic-token-modifier-faces '("unsafe" . rust-unsafe-face))
  (setq lsp-idle-delay 0.500)
  ;; Support parsing compile errors (https://github.com/rust-lang/rust/issues/6887)
  (defvar rustc-compilation-regexps
    (let ((file "\\([^\n]+\\)")
          (start-line "\\([0-9]+\\)")
          (start-col  "\\([0-9]+\\)")
          (end-line   "\\([0-9]+\\)")
          (end-col    "\\([0-9]+\\)")
          (msg-type   "\\(?:[Ee]rror\\|\\([Ww]arning\\)\\|\\([Nn]ote\\|[Hh]elp\\)\\)"))
      (let ((re (concat "^" file ":" start-line ":" start-col
                        ": " end-line ":" end-col
                        " " msg-type ":")))
        (cons re '(1 (2 . 4) (3 . 5) (6 . 7)))))
    "Specifications for matching errors in rustc invocations.
    See `compilation-error-regexp-alist' for help on their format.")
  (defvar rustc-new-compilation-regexps
    (let ((file "\\([^\n]+\\)")
          (start-line "\\([0-9]+\\)")
          (start-col  "\\([0-9]+\\)"))
      (let ((re (concat "^ *--> " file ":" start-line ":" start-col ; --> 1:2:3
                        )))
        (cons re '(1 2 3))))
    "Specifications for matching errors in rustc invocations (new style).
    See `compilation-error-regexp-alist' for help on their format.")
  ;; Match test run failures and panics during compilation as
  ;; compilation warnings
  (defvar cargo-compilation-regexps
    '("^\\s-+thread '[^']+' panicked at \\('[^']+', \\([^:]+\\):\\([0-9]+\\)\\)" 2 3 nil nil 1)
    "Specifications for matching panics in cargo test invocations.
    See `compilation-error-regexp-alist' for help on their format.")

  (eval-after-load 'compile
    '(progn
       (add-to-list 'compilation-error-regexp-alist-alist
                    (cons 'rustc-new rustc-new-compilation-regexps))
       (add-to-list 'compilation-error-regexp-alist 'rustc-new)
       (add-to-list 'compilation-error-regexp-alist-alist
                    (cons 'rustc rustc-compilation-regexps))
       (add-to-list 'compilation-error-regexp-alist 'rustc)
       (add-to-list 'compilation-error-regexp-alist-alist
                    (cons 'cargo cargo-compilation-regexps))
       (add-to-list 'compilation-error-regexp-alist 'cargo)))

                                        ; Search documentation
  (global-set-key (kbd "C-c s") 'helm-dash)

                                        ; outline cycling for outline-minor-mode
  (add-hook 'prog-mode-hook 'outline-minor-mode)
  (add-hook 'yaml-mode-hook 'outline-minor-mode)
  ;; (define-key outline-minor-mode-map (kbd "<C-tab>") 'outline-cycle)

                                        ; Highlight indentation:
  (add-hook 'prog-mode-hook 'highlight-indentation-mode)
  (add-hook 'yaml-mode-hook (lambda ()
                              (highlight-indentation-mode)
                              (highlight-indentation-set-offset 2)))

                                        ; character level diffs
  (setq-default ediff-forward-word-function 'forward-char)
  (setq-default magit-diff-refine-hunk 't)

                                        ; difftastic for magit
  ;; (transient-define-prefix th/magit-aux-commands ()
  ;;   "My personal auxiliary magit commands."
  ;;   ["Auxiliary commands"
  ;;    ("d" "Difftastic Diff (dwim)" th/magit-diff-with-difftastic)
  ;;    ("s" "Difftastic Show" th/magit-show-with-difftastic)])
  ;; (transient-append-suffix 'magit-dispatch "!"
  ;;   '("#" "My Magit Cmds" th/magit-aux-commands))
  ;; (define-key magit-status-mode-map (kbd "#") #'th/magit-aux-commands)


                                        ; Store git references to work-in-progress code:
  (magit-wip-mode)
                                        ;(magit-define-popup-action 'magit-file-popup
                                        ;  ?R "Rename file" 'magit-file-rename)
                                        ;(magit-define-popup-action 'magit-file-popup
                                        ;  ?K "Delete file" 'magit-file-delete)

                                        ; keybinding for vc-ediff
  (global-set-key (kbd "M-m g d") 'vc-ediff)

                                        ; dumb-jumping
  (global-set-key (kbd "M-m j .") 'dumb-jump-go)
                                        ; keybinding for jumping back
  (global-set-key (kbd "M-m j DEL") 'pop-global-mark)

                                        ; I hate changelog mode
  (delete '("[cC]hange\\.?[lL]og?\\'" . change-log-mode) auto-mode-alist)
  (delete '("[cC]hange[lL]og[-.][0-9]+\\'" . change-log-mode) auto-mode-alist)
  (delete '("\\$CHANGE_LOG\\$\\.TXT" . change-log-mode) auto-mode-alist)
  (delete '("[cC]hange[lL]og[-.][-0-9a-z]+\\'" . change-log-mode) auto-mode-alist)

                                        ; no background for comments
  (setq spacemacs-theme-comment-bg nil)

                                        ; mode-specific help
  (global-set-key (kbd "C-h C-m") 'discover-my-major)
  (global-set-key (kbd "C-h M-m") 'discover-my-mode)

                                        ; faster long lines?
  (setq-default bidi-paragraph-direction 'left-to-right)
  (if (version<= "27.1" emacs-version)
      (setq bidi-inhibit-bpa t))
  (global-so-long-mode 1)

                                        ; speedbar on left
  (setq sr-speedbar-right-side nil)

                                        ; M-< and M-> with better defaults
  (beginend-global-mode)

                                        ; hide spaceline minor modes
  (setq spaceline-minor-modes-p nil)

                                        ; writing mode
  (defun writemode-on ()
    (interactive)
    (spacemacs/toggle-line-numbers-off)
    (spacemacs/toggle-vi-tilde-fringe-off)
    (writeroom-mode 1))

  (defun writemode-off ()
    (interactive)
    (spacemacs/toggle-line-numbers-on)
    (spacemacs/toggle-vi-tilde-fringe-on)
    (writeroom-mode 0))


                                        ;(add-hook 'java-mode-hook
                                        ;          (lambda ()
                                        ;            ;; meghanada-mode on
                                        ;            (meghanada-mode t)
                                        ;            ;; enable telemetry
                                        ;            (meghanada-telemetry-enable t)
                                        ;            (flycheck-mode +1)
                                        ;            (setq c-basic-offset 2)
                                        ;            ;; use code format
                                        ;            (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))
                                        ;(add-hook 'java-mode-hook
                                        ;          (lambda () (flycheck-mode t)))
                                        ;(add-hook 'java-mode-hook (lambda ()
                                        ;                            (setq c-basic-offset 2)))
  ;;; TEXT ;;;

                                        ; Enable spell-checking in text modes (but not YAML):
  (dolist (hook '(text-mode-hook))
    (add-hook hook (lambda () (flyspell-mode 1))))
  (dolist (hook '(yaml-mode-hook))
    (add-hook hook (lambda () (flyspell-mode -1))))

                                        ; Visual line mode for text:
  (add-hook 'text-mode-hook 'visual-line-mode)

                                        ; Jekyll
  (defun jekyll-insert-post-url ()
    (interactive)
    (let* ((files (remove "." (mapcar #'file-name-sans-extension (directory-files "."))))
           (selected-file (completing-read "Select article: " files nil t)))
      (insert (format "{%% post_url %s %%}" selected-file))))
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "i p" 'jekyll-insert-post-url)

  (eval-after-load "markdown"
    '(define-key markdown-mode-map (kbd "C-c '") 'markdown-edit-code-block))

                                        ; better dictionary
  (global-set-key (kbd "M-m x w d") 'dictionary-lookup-definition)

                                        ; mmm-mode for markdown (use C-C ' instead)
                                        ;(markdown/init-mmm-mode)
                                        ;(setq mmm-global-mode nil)
                                        ;(mmm-add-classes '((markdown-yaml
                                        ;                    :submode yaml-mode
                                        ;                    :face mmm-declaration-submode-face
                                        ;                    :front "^```yaml[\n\r]+"
                                        ;                    :back "^```$")))
                                        ;(mmm-add-mode-ext-class 'markdown-mode nil 'markdown-yaml)
                                        ;(setq mmm-parse-when-idle 't)
  (setq markdown-command "pandoc -s")

  ;;; PYTHON ;;;

  (setq python-fill-docstring-style (quote symmetric))
  (spacemacs/set-leader-keys-for-major-mode 'python-mode "t ." 'python-pytest-popup)

  ;; ; automatic virtualenv loading; slow if you do it per buffer:
  (setq-default pyvenv-tracking-mode nil)

                                        ; dash set for Python 3
  (setq-default helm-dash-docsets-path (expand-file-name "~/docsets"))

  (defun python-mode-settings ()
    (interactive)
    (setq-local helm-dash-docsets '("Python 3"))
    (setq lsp-file-watch-ignored nil)
    )

                                        ;(require 'lsp-pyright)
                                        ;(setq lsp-pyright-langserver-command "basedpyright")
                                        ;(require 'lsp-pyrefly)
                                        ;(add-hook 'python-mode-hook #'lsp-deferred)
                                        ;(add-hook 'python-ts-mode-hook #'lsp-deferred)
  (add-hook 'python-mode-hook 'python-mode-settings)
  (add-hook 'python-mode-hook 'python-docstring-mode)
  (remove-hook 'python-mode-hook #'pyvenv-tracking-mode)

                                        ; imenu-list
  (setq imenu-list-position 'left)
  (setq org-src-fontify-natively t)
  (setq org-todo-keywords
        '((sequence "TODO" "IN-PROGRESS" "|" "DONE")))

                                        ; pasting in terminals
  (eval-after-load "term"
    '(define-key term-raw-map (kbd "C-c C-y") 'term-paste))
                                        ; make C-y passthrough in vterm; can still use C-c C-y to get from emacs
  (eval-after-load "vterm"
    '(define-key vterm-mode-map (kbd "C-y") 'vterm--self-insert))
                                        ; paste from normal emacs copy/paste
  (eval-after-load "vterm"
    '(define-key vterm-mode-map (kbd "C-c C-y") 'vterm-yank))
                                        ; C-z in terminal
  (eval-after-load "vterm"
    '(define-key vterm-mode-map (kbd "C-c C-z") 'vterm-send-C-z))
                                        ; C-c in terminal
  (eval-after-load "vterm"
    '(define-key vterm-mode-map (kbd "C-c C-c") 'vterm-send-C-c))
                                        ; org-brain
  (setq org-brain-path "~/Devel/slipbox/archive")
  (defun show-org-brain-visualize-keys ()
    (interactive)
    (which-key-show-keymap 'org-brain-visualize-mode-map))
  (spacemacs/set-leader-keys-for-major-mode 'org-brain-visualize-mode "?" 'show-org-brain-visualize-keys)

  (direnv-mode)

  (require 'quarto-mode)

                                        ; LSP with random markdown is too brittle, and sometimes triggers https://github.com/polymode/polymode/issues/316
  (setq-default polymode-lsp-integration nil)

  (with-eval-after-load 'magit
    (require 'forge))

  (require 'lsp-mode)
  (require 'lsp-ltex-plus)
  (lsp-ltex-plus-enable-for-modes)
  (lsp-register-client (make-lsp-client
                        :new-connection (lsp-stdio-connection '("ltex-ls-plus"))
                        :activation-fn (lsp-activate-on "markdown")
                        :server-id 'ltex-ls-plus))

  ;; (lsp-register-client (make-lsp-client
  ;;                       :new-connection (lsp-stdio-connection '("harper-ls" "--stdio"))
  ;;                       :activation-fn (lsp-activate-on "markdown")
  ;;                       :server-id 'harper))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(ignored-local-variable-values '((rustic-indent-offset . 4)))
   '(lsp-auto-guess-root t)
   '(package-selected-packages
     '(ace-jump-helm-line ace-link adoc-mode aggressive-indent all-the-icons
                          auto-compile auto-highlight-symbol auto-yasnippet
                          beginend blacken bmx-mode browse-at-remote bundler
                          centered-cursor-mode clean-aindent-mode code-review
                          column-enforce-mode company-c-headers
                          company-nixos-options company-shell company-web
                          cpp-auto-include csv-mode cython-mode dap-mode
                          define-word deft devdocs diff-hl diminish
                          dired-quick-sort direnv disable-mouse disaster
                          discover-my-major docker dockerfile-mode dotenv-mode
                          drag-stuff dumb-jump eat ein elisp-def elisp-demos
                          elisp-slime-nav emmet-mode emr esh-help
                          eshell-prompt-extras eshell-z eval-sexp-fu evil-anzu
                          evil-args evil-cleverparens evil-escape
                          evil-evilified-state evil-exchange evil-goggles
                          evil-iedit-state evil-indent-plus evil-lion
                          evil-lisp-state evil-matchit evil-mc evil-nerd-commenter
                          evil-numbers evil-org evil-surround evil-textobj-line
                          evil-tutor evil-unimpaired evil-visual-mark-mode
                          evil-visualstar expand-region eyebrowse fancy-battery
                          fish-mode flycheck-bashate flycheck-elsa
                          flycheck-package flyspell-correct-helm gendoxy gh-md
                          git-link git-messenger git-modes git-timemachine
                          gitignore-templates gnuplot go-eldoc go-fill-struct
                          go-gen-test go-guru go-impl go-rename go-tag godoctor
                          golden-ratio google-c-style google-translate
                          graphviz-dot-mode helm-ag helm-c-yasnippet helm-comint
                          helm-company helm-css-scss helm-dash helm-descbinds
                          helm-git-grep helm-ls-git helm-lsp helm-make
                          helm-mode-manager helm-nixos-options helm-org
                          helm-org-rifle helm-projectile helm-purpose helm-pydoc
                          helm-swoop helm-themes helm-xref hide-comnt
                          highlight-indentation highlight-numbers
                          highlight-parentheses hl-todo holy-mode hungry-delete
                          hybrid-mode impatient-mode indent-guide info+
                          insert-shebang inspector js-doc js2-refactor json-mode
                          json-navigator json-reformat just-mode langtool
                          link-hint live-py-mode livid-mode lorem-ipsum
                          lsp-ltex-plus lsp-origami lsp-pyrefly lsp-pyright lsp-ui
                          lua-mode macrostep markdown-toc minitest multi-line
                          multi-term multi-vterm mwim nameless nginx-mode nix-mode
                          nix-update nodejs-repl npm-mode open-junk-file
                          org-cliplink org-contrib org-download org-mime
                          org-pomodoro org-present org-projectile org-rich-yank
                          org-superstar orgit-forge outline-magic overseer
                          page-break-lines pandoc-mode paradox password-generator
                          pip-requirements pipenv pippel poetry polymode popwin
                          powershell prettier-js pug-mode py-isort pydoc
                          pyenv-mode pylookup pytest python-docstring
                          python-pytest quarto-mode quickrun rainbow-delimiters
                          rake remark-mode restart-emacs ron-mode rspec-mode
                          rubocop rubocopfmt ruby-hash-syntax ruby-refactor
                          ruby-test-mode ruby-tools ruff-format rustic sass-mode
                          scss-mode separedit shell-pop shfmt slim-mode smeargle
                          space-doc spaceline spacemacs-purpose-popwin
                          spacemacs-whitespace-cleanup sphinx-doc sql-indent
                          string-edit-at-point string-inflection switch-window
                          symbol-overlay symon tagedit term-cursor terminal-here
                          toc-org toml-mode traad treemacs-icons-dired
                          treemacs-magit treemacs-persp treemacs-projectile
                          undo-fu undo-fu-session unfill vi-tilde-fringe
                          volatile-highlights vundo web-beautify web-mode wgrep
                          winum writeroom-mode ws-butler yaml-mode
                          yasnippet-snippets zeal-at-point))
   '(safe-local-variable-values
     '((projectile-root-local
        . "/home/itamarst/devel/low-level-performance-book/articles/algebraic_floats")
       (web-mode-indent-style . 2) (web-mode-block-padding . 2)
       (web-mode-script-padding . 2) (web-mode-style-padding . 2)
       (lsp-rust-analyzer-linked-projects
        . ["./_quarto_posts/frequency_rs/Cargo.toml"])
       (eval setq lsp-rust-analyzer-linked-projects
             ["./_quarto_posts/frequency_rs/Cargo.toml"])
       (eval setq lsp-rust-analyzer-linked-projects ["./frequency_rs/Cargo.toml"])
       (rust-lsp-all-features . t)
       (eval setq lsp-rust-analyzer-linked-projects
             ["./book/part_2_compilation/frequent_rs/Cargo.toml"])
       (eval setq ispell-personal-dictionary
             (concat (locate-dominating-file default-directory ".dir-locals.el")
                     "book/.aspell.en.pws"))
       (javascript-backend . tide) (javascript-backend . tern)
       (javascript-backend . lsp))))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   )
  )
