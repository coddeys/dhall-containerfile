let Containerfile = ../package.dhall

let demo =
        assert
      : Containerfile.render ./demo.dhall === ./out/Demo.containerfile as Text

let ffmpeg =
        assert
      : (./ffmpeg.dhall).Containerfile === ./out/Ffmpeg.containerfile as Text

in  { demo, ffmpeg }
