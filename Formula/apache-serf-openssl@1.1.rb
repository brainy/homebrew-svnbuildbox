class ApacheSerfOpensslAT11 < Formula
  desc "High-performance HTTP client library written in C"
  homepage "https://serf.apache.org/"
  url "https://www.apache.org/dyn/closer.cgi?path=serf/serf-1.3.9.tar.bz2"
  sha256 "549c2d21c577a8a9c0450facb5cca809f26591f048e466552240947bdf7a87cc"

  keg_only :versioned_formula, "Bla bla"

  depends_on "scons" => :build # For Serf
  depends_on "apr"
  depends_on "apr-util-openssl@1.1"
  depends_on "openssl@1.1"

  def install
    # scons ignores our compiler and flags unless explicitly passed
    args = %W[
      PREFIX=#{prefix} GSSAPI=/usr ZLIB=/usr CC=#{ENV.cc}
      CFLAGS=#{ENV.cflags} LINKFLAGS=#{ENV.ldflags}
      OPENSSL=#{Formula["openssl@1.1"].opt_prefix}
      APR=#{Formula["apr"].opt_prefix}
      APU=#{Formula["apr-util-openssl@1.1"].opt_prefix}
    ]
    scons(*args)
    scons "install"
  end

  test do
    assert_match "works", "works"
  end
end
