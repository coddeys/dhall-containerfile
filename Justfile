examples: demo ffmpeg

demo:
    echo '(./package.dhall).render ./examples/demo.dhall' | dhall text --output ./examples/out/Demo.containerfile

ffmpeg:
    echo '(./examples/ffmpeg.dhall).Containerfile' | dhall text --output ./examples/out/Ffmpeg.containerfile

test:
    dhall freeze --check --all package.dhall
    dhall type --quiet --file ./examples/test.dhall

watch:
    @watchexec -r --clear --exts dhall -- just examples
