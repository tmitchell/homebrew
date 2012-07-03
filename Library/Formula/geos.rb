require 'formula'

class Geos < Formula
  homepage 'http://trac.osgeo.org/geos'
  url 'http://download.osgeo.org/geos/geos-3.3.5.tar.bz2'
  sha1 '791e2b36a9a6114c7f213fae3fc995960c35a428'

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
