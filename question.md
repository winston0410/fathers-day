I am trying to build a simple derivation by myself.  This is my `build.nix` for building the deviation:

```nix
with (import <nixpkgs> {});

derivation {
  name = "fathers-day";
  builder = "${ninja}/bin/ninja";
  inherit ninja;
  args = [];
  system = builtins.currentSystem;
}
```

And this is my `build.ninja`:

```ninja
rule cc
    command = g++ $in -o $out

build my_words: cc ./main.cpp
```

I can confirm that I can build in the cwd with `ninja`, but when I run `nix-build build.nix`, it gives me the following errors:

```shell
ninja: error: loading 'build.ninja': No such file or directory
builder for '/nix/store/dm5qkf8k85q9phkiznvxbvmjxgrg52a4-fathers-day.drv' failed with exit code 1
```

Do I need to set the path somewhere? 
