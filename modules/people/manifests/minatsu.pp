class people::minatsu {
  include osx::dock::autohide
  # Miscellaneous
  include osx::no_network_dsstores # disable creation of .DS_Store files on network shares
  include osx::global::enable_keyboard_control_access

  # via homebrew
  package {
    [
      'tmux',
      'reattach-to-user-namespace', # use tmux to clipbord
      'tree',
      'tig',
      'xz',
      'binutils',
      'coreutils',
      'wget',
      'nkf',
      'graphviz'
    ]:
  }
  package {
    'weechat':
      install_options => [
        '--with-perl',
        '--with-ruby',
        '--with-python'
      ]
  }

  # alfred
  include alfred

  # keyremap4macbook
  include keyremap4macbook
  include keyremap4macbook::login_item
  keyremap4macbook::remap{ 'jis_yen2backslash': }
  keyremap4macbook::remap{ 'jis_unify_eisuu_to_kana': }

  # chrome from the beta channel
  include chrome::beta

  # appcleaner
  include appcleaner

  # iterm2
  include iterm2::dev

  # spectacle
  include spectacle

  # intellij
  class { 'intellij':
    edition => 'ultimate',
    version => '132.839'
  }

  # macvim-kaoriya
  include macvim_kaoriya

  # java
  include java

  # vmware-fusion
  include vmware_fusion

  # pycharm
  class { 'pycharm':
    edition => 'professional',
    version => '3.0.1'
  }

  # pyenv
  include python

  # onyx
  package { 'Onyx-2.8.1':
    provider => 'appdmg',
    source   => 'http://joel.barriere.pagesperso-orange.fr/dl/109/OnyX.dmg',
  }

}
