+++
title = "C'est Moi - Nix"
+++

<link rel="icon" type="image/svg+xml" href="/assets/nix.svg">

# Nix

My first experience with NixOS was in November 2025 when I installed Asahi Linux
on my MacBook for the first time. Since then, my dotfiles have evolved
significantly, expanding from a single host to managing seven different systems
(with plans for two more in the near future).

My earliest learning progress is lost to some Git force-pushing I regret, but
I've since developed a fairly decent understanding of the Nix language. I now
manage the system configurations for my entire family, relying on a modular
flake-parts setup. You can explore my current setup in my
[nix-dots repository](https://github.com/eConnah/nix-dots).

Setting the OS aside, Nix the package manager has become a godsend for my daily
development workflow. It is the best (in my opinion) tool for handling project
dependencies, leaving my home environment clean and removing my worry of version
collisions between different toolchains.

I now utilise Nix in virtually every project I undertake. I typically maintain a
local `devshell`, or, if my groupmates don't mind, I will commit the
configuration directly to the repository for integration with `direnv`.
