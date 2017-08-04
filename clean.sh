#!/bin/bash

cat master/master_2012.json | jq '[.[] | {created_at: .created_at, id: .id, screen_name: .user.screen_name, text: .text}]' > 2012.json

