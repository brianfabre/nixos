{ config, pkgs, inputs, ... }:
{
  home.username = "brian";
  home.homeDirectory = "/home/brian";

  programs.git = {
    enable = true;
    userName = "brian kim";
    userEmail = "briankim53@gmail.com";
  };

  # programs.firefox = {
  #   enable = true;
  #   profiles.default = {
  #     extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
  #       bitwarden
  #       darkreader
  #       # enhancer-for-youtube
  #       libredirect
  #       reddit-enhancement-suite
  #       sidebery
  #       sponsorblock
  #       surfingkeys
  #       ublock-origin
  #     ];
  #     userChrome = (builtins.readFile ./config/firefox/userChrome.css);
  #     extraConfig = ''
  #     /****************************************************************************
  #      * SECTION: FASTFOX                                                         *
  #     ****************************************************************************/
  #     user_pref("nglayout.initialpaint.delay", 0);
  #     user_pref("nglayout.initialpaint.delay_in_oopif", 0);
  #     user_pref("content.notify.interval", 100000);
  #
  #     /** EXPERIMENTAL ***/
  #     user_pref("layout.css.grid-template-masonry-value.enabled", true);
  #     user_pref("dom.enable_web_task_scheduling", true);
  #     user_pref("layout.css.has-selector.enabled", true);
  #     user_pref("dom.security.sanitizer.enabled", true);
  #
  #     /** GFX ***/
  #     //user_pref("gfx.canvas.accelerated", true); // enable if using a dedicated GPU on WINDOWS
  #     user_pref("gfx.canvas.accelerated.cache-items", 4096);
  #     user_pref("gfx.canvas.accelerated.cache-size", 512);
  #     user_pref("gfx.content.skia-font-cache-size", 20);
  #
  #     /** BROWSER CACHE ***/
  #     user_pref("browser.cache.disk.enable", false);
  #
  #     /** MEDIA CACHE ***/
  #     user_pref("media.memory_cache_max_size", 65536);
  #     user_pref("media.cache_readahead_limit", 7200);
  #     user_pref("media.cache_resume_threshold", 3600);
  #
  #     /** IMAGE CACHE ***/
  #     user_pref("image.mem.decode_bytes_at_a_time", 32768);
  #
  #     /** NETWORK ***/
  #     user_pref("network.buffer.cache.size", 262144);
  #     user_pref("network.buffer.cache.count", 128);
  #     user_pref("network.http.max-connections", 1800);
  #     user_pref("network.http.max-persistent-connections-per-server", 10);
  #     user_pref("network.http.max-urgent-start-excessive-connections-per-host", 5);
  #     user_pref("network.http.pacing.requests.enabled", false);
  #     user_pref("network.dnsCacheEntries", 1000);
  #     user_pref("network.dnsCacheExpiration", 86400);
  #     user_pref("network.dns.max_high_priority_threads", 8);
  #     user_pref("network.ssl_tokens_cache_capacity", 10240);
  #
  #     /** SPECULATIVE CONNECTIONS ***/
  #     user_pref("network.http.speculative-parallel-limit", 0);
  #     user_pref("network.dns.disablePrefetch", true);
  #     user_pref("browser.urlbar.speculativeConnect.enabled", false);
  #     user_pref("browser.places.speculativeConnect.enabled", false);
  #     user_pref("network.prefetch-next", false);
  #     user_pref("network.predictor.enabled", false);
  #     user_pref("network.predictor.enable-prefetch", false);
  #
  #     /****************************************************************************
  #      * SECTION: SECUREFOX                                                       *
  #     ****************************************************************************/
  #     /** TRACKING PROTECTION ***/
  #     user_pref("browser.contentblocking.category", "strict");
  #     user_pref("urlclassifier.trackingSkipURLs", "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com");
  #     user_pref("urlclassifier.features.socialtracking.skipURLs", "*.instagram.com, *.twitter.com, *.twimg.com");
  #     user_pref("privacy.partition.bloburl_per_partition_key", true);
  #     user_pref("browser.uitour.enabled", false);
  #     user_pref("privacy.globalprivacycontrol.enabled", true);
  #     user_pref("privacy.globalprivacycontrol.functionality.enabled", true);
  #
  #     /** OCSP & CERTS / HPKP ***/
  #     user_pref("security.OCSP.enabled", 0);
  #     user_pref("security.remote_settings.crlite_filters.enabled", true);
  #     user_pref("security.pki.crlite_mode", 2);
  #     user_pref("security.cert_pinning.enforcement_level", 2);
  #
  #     /** SSL / TLS ***/
  #     user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
  #     user_pref("browser.xul.error_pages.expert_bad_cert", true);
  #     user_pref("security.tls.enable_0rtt_data", false);
  #
  #     /** DISK AVOIDANCE ***/
  #     user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
  #     user_pref("browser.sessionstore.interval", 60000);
  #
  #     /** SHUTDOWN & SANITIZING ***/
  #     user_pref("privacy.history.custom", true);
  #
  #     /** SEARCH / URL BAR ***/
  #     user_pref("browser.search.separatePrivateDefault.ui.enabled", true);
  #     user_pref("browser.urlbar.update2.engineAliasRefresh", true);
  #     user_pref("browser.search.suggest.enabled", false);
  #     user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);
  #     user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
  #     user_pref("browser.formfill.enable", false);
  #     user_pref("security.insecure_connection_text.enabled", true);
  #     user_pref("security.insecure_connection_text.pbmode.enabled", true);
  #     user_pref("network.IDN_show_punycode", true);
  #
  #     /** HTTPS-FIRST POLICY ***/
  #     user_pref("dom.security.https_first", true);
  #
  #     /** PASSWORDS AND AUTOFILL ***/
  #     user_pref("signon.rememberSignons", false);
  #     user_pref("editor.truncate_user_pastes", false);
  #
  #     /** ADDRESS + CREDIT CARD MANAGER ***/
  #     user_pref("extensions.formautofill.addresses.enabled", false);
  #     user_pref("extensions.formautofill.creditCards.enabled", false);
  #
  #     /** MIXED CONTENT + CROSS-SITE ***/
  #     user_pref("network.auth.subresource-http-auth-allow", 1);
  #     user_pref("security.mixed_content.block_display_content", true);
  #     user_pref("pdfjs.enableScripting", false);
  #     user_pref("extensions.postDownloadThirdPartyPrompt", false);
  #
  #     /** HEADERS / REFERERS ***/
  #     user_pref("network.http.referer.XOriginTrimmingPolicy", 2);
  #
  #     /** CONTAINERS ***/
  #     user_pref("privacy.userContext.ui.enabled", true);
  #
  #     /** WEBRTC ***/
  #     user_pref("media.peerconnection.ice.proxy_only_if_behind_proxy", true);
  #     user_pref("media.peerconnection.ice.default_address_only", true);
  #
  #     /** SAFE BROWSING ***/
  #     user_pref("browser.safebrowsing.downloads.remote.enabled", false);
  #
  #     /** MOZILLA ***/
  #     user_pref("identity.fxaccounts.enabled", false);
  #     user_pref("browser.tabs.firefox-view", false);
  #     user_pref("permissions.default.desktop-notification", 2);
  #     user_pref("permissions.default.geo", 2);
  #     user_pref("geo.provider.network.url", "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%");
  #     user_pref("permissions.manager.defaultsUrl", "");
  #     user_pref("webchannel.allowObject.urlWhitelist", "");
  #
  #     /** TELEMETRY ***/
  #     user_pref("toolkit.telemetry.unified", false);
  #     user_pref("toolkit.telemetry.enabled", false);
  #     user_pref("toolkit.telemetry.server", "data:,");
  #     user_pref("toolkit.telemetry.archive.enabled", false);
  #     user_pref("toolkit.telemetry.newProfilePing.enabled", false);
  #     user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
  #     user_pref("toolkit.telemetry.updatePing.enabled", false);
  #     user_pref("toolkit.telemetry.bhrPing.enabled", false);
  #     user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
  #     user_pref("toolkit.telemetry.coverage.opt-out", true);
  #     user_pref("toolkit.coverage.opt-out", true);
  #     user_pref("datareporting.healthreport.uploadEnabled", false);
  #     user_pref("datareporting.policy.dataSubmissionEnabled", false);
  #     user_pref("app.shield.optoutstudies.enabled", false);
  #     user_pref("browser.discovery.enabled", false);
  #     user_pref("breakpad.reportURL", "");
  #     user_pref("browser.tabs.crashReporting.sendReport", false);
  #     user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);
  #     user_pref("captivedetect.canonicalURL", "");
  #     user_pref("network.captive-portal-service.enabled", false);
  #     user_pref("network.connectivity-service.enabled", false);
  #     user_pref("app.normandy.enabled", false);
  #     user_pref("app.normandy.api_url", "");
  #     user_pref("browser.ping-centre.telemetry", false);
  #     user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
  #     user_pref("browser.newtabpage.activity-stream.telemetry", false);
  #
  #     /****************************************************************************
  #      * SECTION: PESKYFOX                                                        *
  #     ****************************************************************************/
  #     /** MOZILLA UI ***/
  #     user_pref("layout.css.prefers-color-scheme.content-override", 2);
  #     user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
  #     user_pref("app.update.suppressPrompts", true);
  #     user_pref("browser.compactmode.show", true);
  #     user_pref("browser.privatebrowsing.vpnpromourl", "");
  #     user_pref("extensions.getAddons.showPane", false);
  #     user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
  #     user_pref("browser.shell.checkDefaultBrowser", false);
  #     user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
  #     user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
  #     user_pref("browser.preferences.moreFromMozilla", false);
  #     user_pref("browser.tabs.tabmanager.enabled", false);
  #     user_pref("browser.aboutConfig.showWarning", false);
  #     user_pref("browser.aboutwelcome.enabled", false);
  #     user_pref("browser.display.focus_ring_on_anything", true);
  #     user_pref("browser.display.focus_ring_style", 0);
  #     user_pref("browser.display.focus_ring_width", 0);
  #     user_pref("browser.privateWindowSeparation.enabled", false); // WINDOWS
  #     user_pref("cookiebanners.service.mode", 2);
  #     user_pref("cookiebanners.service.mode.privateBrowsing", 2);
  #     user_pref("browser.translations.enable", true);
  #
  #     /** FULLSCREEN ***/
  #     user_pref("full-screen-api.transition-duration.enter", "0 0");
  #     user_pref("full-screen-api.transition-duration.leave", "0 0");
  #     user_pref("full-screen-api.warning.delay", -1);
  #     user_pref("full-screen-api.warning.timeout", 0);
  #
  #     /** URL BAR ***/
  #     user_pref("browser.urlbar.suggest.engines", false);
  #     user_pref("browser.urlbar.suggest.topsites", false);
  #     user_pref("browser.urlbar.suggest.calculator", true);
  #     user_pref("browser.urlbar.unitConversion.enabled", true);
  #
  #     /** NEW TAB PAGE ***/
  #     user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
  #     user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
  #
  #     /*** POCKET ***/
  #     user_pref("extensions.pocket.enabled", false);
  #
  #     /** DOWNLOADS ***/
  #     user_pref("browser.download.useDownloadDir", false);
  #     user_pref("browser.download.always_ask_before_handling_new_types", true);
  #     user_pref("browser.download.alwaysOpenPanel", false);
  #     user_pref("browser.download.manager.addToRecentDocs", false);
  #
  #     /** PDF ***/
  #     user_pref("browser.download.open_pdf_attachments_inline", true);
  #     user_pref("pdfjs.sidebarViewOnLoad", 2);
  #
  #     /** TAB BEHAVIOR ***/
  #     user_pref("browser.bookmarks.openInTabClosesMenu", false);
  #     user_pref("browser.menu.showViewImageInfo", true);
  #     user_pref("findbar.highlightAll", true);
  #
  #     /****************************************************************************
  #      * SECTION: SMOOTHFOX                                                       *
  #     ****************************************************************************/
  #     // visit https://github.com/yokoffing/Betterfox/blob/main/Smoothfox.js
  #     // Enter your scrolling prefs below this line:
  #
  #     // recommended for 120hz+ displays
  #     // largely matches Chrome flags: Windows Scrolling Personality and Smooth Scrolling
  #     // from https://github.com/AveYo/fox/blob/cf56d1194f4e5958169f9cf335cd175daa48d349/Natural%20Smooth%20Scrolling%20for%20user.js
  #     user_pref("apz.overscroll.enabled", true); // not DEFAULT on Linux
  #     user_pref("general.smoothScroll", true); // DEFAULT
  #     user_pref("general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS", 12);
  #     user_pref("general.smoothScroll.msdPhysics.enabled", true);
  #     user_pref("general.smoothScroll.msdPhysics.motionBeginSpringConstant", 600);
  #     user_pref("general.smoothScroll.msdPhysics.regularSpringConstant", 650);
  #     user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaMS", 25);
  #     user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaRatio", 2.0);
  #     user_pref("general.smoothScroll.msdPhysics.slowdownSpringConstant", 250);
  #     user_pref("general.smoothScroll.currentVelocityWeighting", 1.0);
  #     user_pref("general.smoothScroll.stopDecelerationWeighting", 1.0);
  #     user_pref("mousewheel.default.delta_multiplier_y", 300); // 250-400; adjust this number to your liking
  #
  #     /****************************************************************************
  #      * START: MY OVERRIDES                                                      *
  #     ****************************************************************************/
  #     // Enter your personal prefs below this line:
  #     user_pref("signon.formlessCapture.enabled", true);
  #     // user_pref("signon.autofillForms", true);
  #     user_pref("signon.rememberSignons", true);
  #     user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org");
  #     user_pref("browser.tabs.firefox-view-newIcon", false);
  #     // user_pref("editor.truncate_user_pastes", true);
  #
  #     /****************************************************************************
  #      * END: BETTERFOX                                                           *
  #     ****************************************************************************/
  #     '';
  #   };
  # };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtraFirst = ''
    '';
    initExtra = ''
      if [ -n "''${commands[fzf-share]}" ]; then
        source "''$(fzf-share)/key-bindings.zsh"
        source "''$(fzf-share)/completion.zsh"
      fi

      # find and set branch name var if in git repository.
      function git_branch_name()
      {
        branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
        if [[ $branch == "" ]];
        then
          :
        else
          echo ' - ('$branch')'
        fi
      }

      # enable substitution in prompt.
      setopt prompt_subst
      # config for prompt. ps1 synonym.
      PROMPT='[%~$(git_branch_name)]$ '
      # PROMPT="[%n %~]$ "

      export EDITOR="nvim"
      export VISUAL="nvim"
      export OPENER=xdg-open

      # colored man pages
      export MANPAGER="less -R --use-color -Dd+r -Du+b"
      export MANROFFOPT="-P -c"

      # function for if file exists, source
      # ex: include ~/.zshrc
      include() {
      	[[ -f "$1" ]] && source "$1"
      }

      # pacman
      alias pacin="pacman -Slq | fzf --height=100% --multi --preview 'pacman -Si {1}' --preview-window=65% | xargs -ro sudo pacman -S"
      alias pacre="pacman -Qq | fzf --height=100% --multi --preview 'pacman -Qi {1}' --preview-window=65% | xargs -ro sudo pacman -Rns"

      # bemenu
      export BEMENU_OPTS="--fn 'Hack 11'"

      # fzf
      export FZF_DEFAULT_COMMAND="fd --type file --hidden --no-ignore --color=always"
      export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
      export FZF_DEFAULT_OPTS="--ansi --height=40% --reverse --border=none"

      # Edit line in vim with ctrl-e:
      autoload edit-command-line
      zle -N edit-command-line
      bindkey '^e' edit-command-line

      set -o emacs

      alias nv="nvim"
      alias lg="lazygit"
      alias rm='rm -i'
      alias mv='mv -i'
      alias ls='eza'
      alias ll='eza -lab --icons'
      alias lz='NVIM_APPNAME=lazyvim nvim'
      alias ks='NVIM_APPNAME=nvim-ks nvim'

      # lf cd function
      lfcd() {
      	tmp="$(mktemp)"
      	lf -last-dir-path="$tmp" "$@"
      	if [ -f "$tmp" ]; then
      		dir="$(cat "$tmp")"
      		rm -f "$tmp"
      		if [ -d "$dir" ]; then
      			if [ "$dir" != "$(pwd)" ]; then
      				cd "$dir"
      			fi
      		fi
      	fi
      }

      alias lf="lfcd"

      # fkill - kill processes - list only the ones you can kill
      fkill() {
      	local pid
      	if [ "$UID" != "0" ]; then
      		pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
      	else
      		pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
      	fi

      	if [ "x$pid" != "x" ]; then
      		echo $pid | xargs kill -''${1:-9}
      	fi
      }

      # search files fzf
      fe() {
      	files=(''$(
      	    fd -t f --color=always --hidden --no-ignore-vcs \
      	    	--exclude ".git" \
      	    	--exclude ".local" \
    	    	--exclude "mnt" |
      	    	fzf-tmux --query="''$1" --multi --select-1 --exit-0
      	))
      	if [[ -n "''$files" ]]; then
      		for file in "''${files[@]}"; do
      			extension="''${file##*.}"
      			if [[ "''$extension" =~ (pdf|jpg|jpeg|JPG|png)''$ ]]; then
      				xdg-open "''$file"
      			else
      				''${EDITOR:-vim} "''$file"
      			fi
      		done
      	fi
      }

      # cd to directory fzf
      fcd() {
      	local dir
      	dir=''$(fd ''${1:-.} --exclude '.git' \
      		--exclude '.mozilla' \
      		--exclude '_*' \
      		-t d --hidden --no-ignore-vcs | fzf-tmux +m) &&
      		cd "''$dir"
      }

      # zsh completion
      zstyle ':completion:*' menu select
    '';
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.1";
          sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0";
        };
      }
    ];
  };

  imports = [
    ./modules/firefox.nix
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    #
    lf
    neovim

    # archives
    zip
    xz
    unzip
    p7zip

    # other
    dunst
    eza
    fd
    fzf
    lazygit
    lua-language-server
    mupdf
    ncdu
    neofetch
    # prettier
    R
    ripgrep
    stylua
    tesseract
    xfce.thunar
    usbutils
    zathura
  ];

  home.file = {
    ".config/dunst".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/dunst";
    ".config/foot".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/foot";
    ".config/lf".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/lf";
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/nvim";
    ".config/utils".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/utils";
    ".config/xkb".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/xkb";
    ".config/yambar".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/yambar";
    ".config/zathura".source = config.lib.file.mkOutOfStoreSymlink "/home/brian/nixos/config/zathura";
  };

  home.pointerCursor =
    let
      getFrom = url: hash: name: {
          gtk.enable = true;
          x11.enable = true;
          name = name;
          size = 48;
          package =
            pkgs.runCommand "moveUp" {} ''
              mkdir -p $out/share/icons
              ln -s ${pkgs.fetchzip {
                url = url;
                hash = hash;
              }} $out/share/icons/${name}
          '';
        };
    in
      getFrom
        "https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.4/Bibata-Original-Classic.tar.xz"
        "sha256-38l5eaRmujGc3TF/sSkdImBkFrgDCB/0ijj7H0t8xrE="
        "Bibata";

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
