#!/usr/bin/env raku
my (%sizes, %tree, @list, $count);
sub dir($a) { $a.join("/") }
for (lines) {
  when /cd\s*".."/ { @list.pop; }
  when /cd\s+(\S*)/ {
    @list.push($0);
    %tree{dir @list} = [];
  }
  when /\d+/ { %sizes{dir @list} += $/; }
  when /dir.(.*)/ { %tree{dir @list}.push((dir @list) ~ "/$0"); }
}
sub size($a) { (%sizes{$a} or 0) + (%tree{$a} or ()).map(&size).sum }
say %tree.keys.map(&size).grep(* >= (size "/") - 4e7).min;
