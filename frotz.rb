require 'formula'

class Frotz < Formula
  url 'http://downloads.sourceforge.net/project/frotz/frotz/2.43/frotz-2.43.tar.gz'
  homepage 'http://frotz.sourceforge.net/'
  sha1 '2b2684ec670b471489c15be732c7dd1c59821b00'

  def install
    inreplace "Makefile" do |s|
      s.remove_make_var! %w[CC OPTS]
      s.change_make_var! "PREFIX", prefix
      s.change_make_var! "CONFIG_DIR", etc
      s.change_make_var! "MAN_PREFIX", share
    end

    system "make frotz"
    system "make install"
  end
end
