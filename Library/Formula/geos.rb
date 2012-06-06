require 'formula'

class Geos < Formula
  url 'http://download.osgeo.org/geos/geos-3.3.4.tar.bz2'
  homepage 'http://trac.osgeo.org/geos/'
  sha1 '2ec4be729c851460daf89d0d2ab785be5ef4c5c5'

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
