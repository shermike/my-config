require 'irb/ext/save-history'
#History configuration
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

require_relative '/nfs/site/home/msherste/.ruby/interactive_editor.rb'

def vim
  vi '/nfs/site/home/msherste/.ruby/session.rb'
end
