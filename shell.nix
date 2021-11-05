{ pkgs ? import <nixpkgs> {} }:
let
  myHask = pkgs.ghc.withHoogle (hp: with hp; [
    haskell-language-server
    ghcid
    #
    unix
    bytestring
  ]);
in pkgs.mkShell {
  buildInputs = [ myHask ] ++ (with pkgs; [cabal-install]);
}
