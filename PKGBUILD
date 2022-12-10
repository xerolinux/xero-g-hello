# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>

pkgname=xero-g-hello
pkgver=1.0.0
pkgrel=2
pkgdesc='Welcome screen for XeroLinux'
arch=('x86_64')
license=(GPLv3)
url="https://github.com/xerolinux/xero-g-hello.git"
depends=('gtk3' 'glib2')
makedepends=('meson' 'git' 'mold' 'rustup' 'clang')
source=("${pkgname}::git+$url")
sha512sums=('SKIP')
#provides=('xerowelcome')
replaces=('xerolinux-tool' 'xerolinux-tool-dev')
options=(strip)

build() {
  cd "${srcdir}/${pkgname}"

  if ! rustc --version | grep nightly >/dev/null 2>&1; then
    echo "Installing nightly compiler…"
    rustup toolchain install nightly
    rustup default nightly
  fi

  _cpuCount=$(grep -c -w ^processor /proc/cpuinfo)

  export RUSTFLAGS="-Cembed-bitcode -C opt-level=3 -Ccodegen-units=1 -Clinker=clang -C link-arg=-flto -Clink-arg=-fuse-ld=/usr/bin/mold"
  meson --buildtype=release --prefix=/usr build

  meson compile -C build --jobs $_cpuCount
}

package() {
  cd "${srcdir}/${pkgname}"/build

  export RUSTFLAGS="-Cembed-bitcode -C opt-level=3 -Ccodegen-units=1 -Clinker=clang -C link-arg=-flto -Clink-arg=-fuse-ld=/usr/bin/mold"
  DESTDIR="${pkgdir}" meson install

  cp "$pkgdir/usr/share/applications/xerowelcome.desktop" "$pkgdir/usr/share/xerowelcome.desktop"

  install -Dvm644 ../xerowelcome.desktop \
    "$pkgdir/etc/skel/.config/autostart/$pkgname.desktop"
}

# vim:set sw=2 sts=2 et:
