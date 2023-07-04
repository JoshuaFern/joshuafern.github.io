{ pkgs ? import <nixpkgs> {
    config.allowUnfree = true;
  } }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    git # Distributed version control system
    jekyll # A blog-aware, static site generator, written in Ruby
    bundler # Manage your Ruby application's gem dependencies
  ];
}
