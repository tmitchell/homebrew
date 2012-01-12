require 'formula'

class Geos < Formula
  url 'http://download.osgeo.org/geos/geos-3.3.2.tar.bz2'
  homepage 'http://trac.osgeo.org/geos/'
  sha1 '942b0bbc61a059bd5269fddd4c0b44a508670cb3'

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
