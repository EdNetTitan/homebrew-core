class Voacapl057 < Formula
  desc "Voice Of America Coverage Analysis Program"
  homepage "https://www.vocap.com"
  url "http://www.qsl.net/hz1jw/voacapl/downloads/voacapl-0.5.7.tar.gz"
  sha256 "f031ed5f846e984ac5a0578a4b59912894711867d62eb3f32f55634990f0114a"
  license "GLWTPL"

  depends_on "cmake" => :build
  depends_on "gcc"

  def install
    if OS.mac? && MacOS.version <= :sierra
      # Requires the CLT to be the active developer directory if Xcode is installed
      ENV["SDKROOT"] = MacOS.sdk_path
      # Fix build failure for compiler_builtins "error: invalid deployment target
      # for -stdlib=libc++ (requires OS X 10.7 or later)"
      ENV["MACOSX_DEPLOYMENT_TARGET"] = MacOS.version
    end

    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make"
    system '"make install"'
    system "makeitshfbc"
  end

  test do
    assert_contains "Run Directory", shell_output("voacapl ~/itshfbc")
  end
end
