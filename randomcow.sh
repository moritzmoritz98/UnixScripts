#!/bin/bash

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # Let a cow think ever 2 sec one nice fortune-quote and lolcat the results# #
# # @date 06-02-2018                                                        # #
# # @author Moritz Kirschte                                                 # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
while true; do fortune -c | cowthink -f $(find /usr/share/cows -type f | shuf -n 1) | lolcat; sleep 2; done
