class BoostBcp < Formula
  desc "Utility for extracting subsets of the Boost library"
  homepage "http://www.boost.org/doc/tools/bcp/"
  url "https://downloads.sourceforge.net/project/boost/boost/1.60.0/boost_1_60_0.tar.bz2"
  sha256 "686affff989ac2488f79a97b9479efb9f2abae035b5ed4d8226de6857933fd3b"

  head "https://github.com/boostorg/boost.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "07b540bdd4ae48b8e7b48e089d63382dcf6f4e7ed8c1f72c956c6e776a3feb32" => :el_capitan
    sha256 "71d25484a604cd15ab49d1740ecb9ca181cf70e9cba91e6877e25e774510992b" => :yosemite
    sha256 "e082c3a1f606aeb3445925f8b77a47affd4eb30c9da8e5acb3ec28987dc1ed39" => :mavericks
  end

  depends_on "boost-build" => :build

  def install
    cd "tools/bcp" do
      system "b2"
      prefix.install "../../dist/bin"
    end
  end

  test do
    system bin/"bcp", "--help"
  end
end
