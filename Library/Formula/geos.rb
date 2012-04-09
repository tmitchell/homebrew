require 'formula'

class Geos < Formula
  url 'http://download.osgeo.org/geos/geos-3.3.3.tar.bz2'
  homepage 'http://trac.osgeo.org/geos/'
  sha1 '2ecd23c38d74e5f04757dc528ec30858006fb6a7'

  def skip_clean? path
    path.extname == '.la'
  end

  fails_with_llvm "Some symbols are missing during link step."

  def install
    ENV.O3
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end
