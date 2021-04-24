#!/usr/bin/env fish

for file in ~/*
  if test ! -d $file -a (echo "$file" | sed 's/^.*\.//g') = 'osz'
    set name (echo $file | sed 's/.*[^\\\\]\\///g' | sed 's/\.osz$//')
    set folder "$HOME/.local/share/osu-stable/Songs/$name"
    mkdir "$folder"
    unzip -d "$folder" "$file"
    rm "$file"
  end
end
