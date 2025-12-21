{ pkgs, inputs, ... }:

let
  rustToolchain = pkgs.rust-bin.stable.latest;
in

{
  # Use rust-overlay provided by the flake
  nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];

  home.packages = with pkgs; [
    rustToolchain.default

    sccache
    gcc
    bacon
    cargo-edit
    cargo-watch
    cargo-deny
    cargo-outdated
    cargo-mommy

    dioxus-cli
  ];

  # Environment variables for Rust tooling
  home.sessionVariables = {
    RUST_BACKTRACE = "1";

    # Provide Rust source path for rust-analyzer
    RUST_SRC_PATH = "${rustToolchain.rust-src}/lib/rustlib/src/rust";
  };
}
