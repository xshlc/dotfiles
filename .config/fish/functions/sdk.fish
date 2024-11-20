# wrapper function for sdkman!

# copyright (c) 2018-2023 raphael reitzig
# mit license (mit)
# https://github.com/reitzig/sdkman-for-fish

# function sdk -d "manage sdks"
#     # guard: sdkman! needs to be installed
#     if not test -f "$__fish_sdkman_init"
#         # propose to install sdkman!
#
#         function read_confirm
#             while true
#                 read -l -p "$argv[1] [y/n] " confirm
#
#                 switch $confirm
#                 case y y
#                     return 0
#                 case '' n n
#                     return 1
#                 end
#             end
#         end
#
#         if read_confirm "you don't seem to have sdkman! installed. install now?"
#             if not which curl > /dev/null
#                 echo "curl required"
#                 return 1
#             end
#             if not which bash > /dev/null
#                 echo "bash required"
#                 return 1
#             end
#
#             curl -s "https://get.sdkman.io" | bash | sed '/all done!/q'
#             echo "please open a new terminal/shell to load sdkman!"
#         end
#     else
#         # declare the _actual_ sdk command for fish
#         __fish_sdkman_run_in_bash "source \"$__fish_sdkman_noexport_init\" && sdk $argv"
#     end
# end
#
function sdk
  bass source ~/.sdkman/bin/sdkman-init.sh ';' sdk $argv
end
