with import <nixpkgs> { };
mkShell {
  name = "python-devel";
  venvDir = "venv";

  buildInputs = with python310Packages; [ numpy tensorflow jupyter venvShellHook stdenv.cc.cc.lib ];

  postShellHook = ''
    pip install -r requirements.txt
    export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [
      stdenv.cc.cc
    ]}
  '';
}
