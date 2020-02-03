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
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(ruby
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
     ;; lsp
     markdown
     (rust :variables rust-backend 'lsp)
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
             python-test-runner 'pytest)
     javascript
     yaml
     shell-scripts
     (go :variables gofmt-command "goimports" go-tab-width nil)
     c-c++
     html
     org
     docker
     deft
     dap
     lsp
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      mmm-mode
                                      switch-window
                                      helm-dash
                                      flycheck-vale
                                      outline-magic
                                      remark-mode
                                      dictionary
                                      discover-my-major
                                      sudo-ext
                                      pandoc-mode
                                      beginend
                                      visual-regexp-steroids
                                      python-docstring
                                      python-pytest
                                      traad
                                      writeroom-mode
                                      blacken
                                      company-box
                                      edit-indirect
                                      editorconfig
                                      graphviz-dot-mode
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(smartparens rainbow-delimiters)

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
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

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

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

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

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Source Code Pro"
                               :weight normal
                               :width normal
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
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

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
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

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

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
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

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

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
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

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
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

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
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

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

  ; Rust
  (setq rust-format-on-save 't)
  (setq lsp-ui-doc-enable nil)
  
  ; Nicer autocomplete
  (add-hook 'python-mode-hook 'company-box-mode)

  ; Search documentation
  (global-set-key (kbd "C-c s") 'helm-dash)

  ; outline cycling for outline-minor-mode
  (add-hook 'prog-mode-hook 'outline-minor-mode)
  (add-hook 'yaml-mode-hook 'outline-minor-mode)
  (define-key outline-minor-mode-map (kbd "<C-tab>") 'outline-cycle)

  ; Highlight indentation:
  (add-hook 'prog-mode-hook 'highlight-indentation-mode)
  (add-hook 'yaml-mode-hook (lambda ()
                              (highlight-indentation-mode)
                              (highlight-indentation-set-offset 2)))

  ; character level diffs
  (setq-default ediff-forward-word-function 'forward-char)
  (setq-default magit-diff-refine-hunk 't)

  ; Store git references to work-in-progress code:
  ;(magit-wip-mode)
  ;(magit-define-popup-action 'magit-file-popup
  ;  ?R "Rename file" 'magit-file-rename)
  ;(magit-define-popup-action 'magit-file-popup
  ;  ?K "Delete file" 'magit-file-delete)

  ; keybinding for vc-ediff
  (global-set-key (kbd "M-m g d") 'vc-ediff)

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

  ; faster comint
  (setq-default bidi-display-reordering nil)

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

  ; style check
  (flycheck-vale-setup)
  (add-hook 'markdown-mode-hook 'flycheck-mode)
  (add-hook 'rst-mode-hook 'flycheck-mode)

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

  ;; ; automatic virtualenv loading:
  ;; (defun pyvenv-autoload ()
  ;;   (defun load-if-exists (path)
  ;;     (if (file-exists-p path)
  ;;         (progn
  ;;           (pyvenv-activate path)
  ;;           (setq-local pyvenv-activate path))))
  ;;   (let* ((pdir (projectile-project-root)))
  ;;     (load-if-exists (concat pdir "/virtualenv"))
  ;;     (load-if-exists (concat pdir "/venv"))))
  ;; (add-hook 'python-mode-hook 'pyvenv-autoload)
  ;; (defun pyvenv-switch ()
  ;;   (if (eq major-mode 'python-mode)
  ;;       (pyvenv-track-virtualenv)))
  ;; (add-hook 'window-configuration-change-hook 'pyvenv-switch)

  ; dash set for Python 3
  (defun python-doc ()
    (interactive)
    (setq-local helm-dash-docsets '("Python 3")))
  (add-hook 'python-mode-hook 'python-doc)
  (add-hook 'python-mode-hook 'python-docstring-mode)

  ; imenu-list
  (setq imenu-list-position 'left)
  (setq org-src-fontify-natively t)
  (setq org-todo-keywords
        '((sequence "TODO" "IN-PROGRESS" "|" "DONE")))

  ; pasting in terminals
  (eval-after-load "term"
    '(define-key term-raw-map (kbd "C-c C-y") 'term-paste))
  (eval-after-load "vterm"
    '(define-key vterm-mode-map (kbd "C-c C-y") 'vterm-yank-primary))

  ; org-brain
  (setq org-brain-path "~/Devel/slipbox/archive")
  (defun show-org-brain-visualize-keys ()
    (interactive)
    (which-key-show-keymap 'org-brain-visualize-mode-map))
  (spacemacs/set-leader-keys-for-major-mode 'org-brain-visualize-mode "?" 'show-org-brain-visualize-keys)
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
 '(package-selected-packages
   (quote
    (ascii-art-to-unicode zetteldeft deft seeing-is-believing rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe rbenv rake minitest helm-gtags ggtags enh-ruby-mode counsel-gtags counsel swiper ivy chruby bundler inf-ruby lsp-ui lsp-python-ms helm-lsp dap-mode lsp-treemacs bui cquery company-lsp ccls lsp-mode yasnippet-snippets yapfify yaml-mode xterm-color web-mode web-beautify vterm visual-regexp-steroids visual-regexp unfill treemacs-magit traad virtualenvwrapper toml-mode terminal-here tagedit switch-window sudo-ext smeargle slim-mode shell-pop scss-mode sass-mode remark-mode racer python-pytest python-docstring pytest pyenv-mode py-isort pug-mode prettier-js pippel pipenv pyvenv pip-requirements pandoc-mode outline-magic origami orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download org-cliplink org-brain org-ql peg ov org-super-agenda ts nodejs-repl mwim multi-term mmm-mode markdown-toc magit-svn magit-gitflow magit-popup livid-mode skewer-mode live-py-mode json-navigator hierarchy js2-refactor multiple-cursors js2-mode js-doc insert-shebang importmagic epc ctable concurrent impatient-mode simple-httpd htmlize helm-rtags helm-pydoc helm-org-rifle helm-org helm-gitignore helm-git-grep helm-dash dash-docs helm-css-scss helm-company helm-c-yasnippet haml-mode graphviz-dot-mode google-c-style godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc gnuplot gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-ycmd flycheck-vale flycheck-rust flycheck-rtags flycheck-pos-tip pos-tip flycheck-bashate fish-mode evil-org evil-magit magit git-commit with-editor eshell-z eshell-prompt-extras esh-help emmet-mode edit-indirect dockerfile-mode docker transient tablist json-mode docker-tramp json-snatcher json-reformat discover-my-major makey disaster diff-hl dictionary link connection cython-mode cpp-auto-include company-ycmd ycmd request-deferred deferred company-web web-completion-data company-tern dash-functional tern company-statistics company-shell company-rtags rtags company-go go-mode company-c-headers company-anaconda company clang-format cargo markdown-mode rust-mode browse-at-remote blacken beginend auto-yasnippet yasnippet auto-dictionary anaconda-mode pythonic ac-ispell auto-complete ws-butler writeroom-mode visual-fill-column winum volatile-highlights vi-tilde-fringe uuidgen treemacs-projectile treemacs ht pfuture toc-org symon symbol-overlay string-inflection spaceline-all-the-icons spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode password-generator paradox spinner overseer org-bullets open-junk-file nameless move-text macrostep lorem-ipsum link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-xref helm-themes helm-swoop helm-purpose window-purpose imenu-list helm-projectile projectile helm-mode-manager helm-make helm-ls-git helm-flx helm-descbinds helm-ag google-translate golden-ratio flycheck-package package-lint flycheck pkg-info epl let-alist flycheck-elsa flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state iedit evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens smartparens paredit evil-args evil-anzu anzu eval-sexp-fu elisp-slime-nav editorconfig dumb-jump doom-modeline shrink-path all-the-icons memoize f dash s devdocs define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile packed aggressive-indent ace-window ace-link ace-jump-helm-line helm avy helm-core popup which-key use-package pcre2el org-plus-contrib hydra lv hybrid-mode font-lock+ evil goto-chg undo-tree dotenv-mode diminish bind-map bind-key async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
