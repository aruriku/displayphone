{ stdenv
, lib
, bash
, android-tools
, makeWrapper
, scrcpy
}:
  stdenv.mkDerivation {
    pname = "displayphone";
    version = "dev";
    src = ./.;

    buildInputs = [ bash scrcpy android-tools ];
    nativeBuildInputs = [ makeWrapper ];
    installPhase = ''
      #Install script
      mkdir -p $out/bin
      cp displayphone.sh $out/bin/displayphone
      chmod +x $out/bin/displayphone
      wrapProgram $out/bin/displayphone \
        --prefix PATH : ${lib.makeBinPath [ bash scrcpy android-tools ]}

      mkdir -p $out/share/applications
      cp displayphone.desktop $out/share/applications
      chmod +x $out/share/applications/displayphone.desktop
    '';
}
