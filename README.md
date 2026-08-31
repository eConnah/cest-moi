# cest-moi

A repo for building and writing my about me page.

## Serving Live

For activly developing you can serve the project live by opening two terminals
and running both these commands.

```bash
watchexec --exts md,css,toml -- ndg html
darkhttpd build --port 3000
```

## Building

Once you are happy you can use nix to build a minimal docker container for
deploying.

```
nix build
docker load -i result
```
