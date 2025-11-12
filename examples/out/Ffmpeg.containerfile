FROM fedora:latest

# Install build and runtime reqs
RUN dnf install -y autoconf automake cmake freetype-devel gcc gcc-c++ git libtool make nasm pkgconfig zlib-devel numactl-devel libxcb-devel numactl libxcb

# yasm: autoreconf -fiv ./configure --prefix="/usr/local"
RUN cd /usr/local/src && git clone --depth 1 git://github.com/yasm/yasm.git && cd yasm && autoreconf -fiv && ./configure --prefix="/usr/local" && make && make install

# x264: ./configure --prefix="/usr/local" --enable-static
RUN cd /usr/local/src && git clone --depth 1 https://code.videolan.org/videolan/x264.git && cd x264 && ./configure --prefix="/usr/local" --enable-static && make && make install

# ffmpeg: PKG_CONFIG_PATH="/usr/local/lib/pkgconfig" ./configure --prefix="/usr/local" --extra-cflags="-I/usr/local/include" --extra-ldflags="-L/usr/local/lib" --pkg-config-flags="--static" --enable-gpl --enable-nonfree --enable-libx264 --enable-libxcb
RUN cd /usr/local/src && git clone --depth 1 git://source.ffmpeg.org/ffmpeg && cd ffmpeg && PKG_CONFIG_PATH="/usr/local/lib/pkgconfig" ./configure --prefix="/usr/local" --extra-cflags="-I/usr/local/include" --extra-ldflags="-L/usr/local/lib" --pkg-config-flags="--static" --enable-gpl --enable-nonfree --enable-libx264 --enable-libxcb && make && make install

ENV PATH=/.local/bin:${PATH}
# Cleanup
RUN rm -Rf /usr/local/src/* && dnf clean all && dnf erase -y autoconf automake cmake freetype-devel gcc gcc-c++ git libtool make nasm pkgconfig zlib-devel numactl-devel libxcb-devel

ENTRYPOINT ["/usr/local/bin/ffmpeg"]
