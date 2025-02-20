class Clac < Formula
  desc "Command-line, stack-based calculator with postfix notation"
  homepage "https://github.com/soveran/clac"
  url "https://github.com/soveran/clac/archive/0.3.3.tar.gz"
  sha256 "e751e31bd2d3cdf6daa80da0ea7761630767aa22df6954df35997d1fcc5fa8ae"
  license "BSD-2-Clause"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "4bd59227583efc4d66882810450c59dad080493f8f442ee5655e21158c2c1d67"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "5c24643fb296c8c63366fcd003bcf1833bea55e17e596f3712d2c46d2924dacb"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "175565be3821dd977d0d0b59def680e2750c909e505a70c339c23672f051be23"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "5579baf3a429639b0cab2098d4dd5711fef715b6599a34b4b5ce11c383e8dbd6"
    sha256 cellar: :any_skip_relocation, sonoma:         "82c7e8e387b0208af2748c4f4105338aad6a534b303c392c39c3df3bbd1efe2c"
    sha256 cellar: :any_skip_relocation, ventura:        "0a838fd0f803107e4e4315c8b9184f64f8727af3c3eb26362fe5e0880435484b"
    sha256 cellar: :any_skip_relocation, monterey:       "eb6f4d5f2edbd8e82274f9424e09f1a0635868370285f98a747e2006bde83b45"
    sha256 cellar: :any_skip_relocation, big_sur:        "8582b92bdb32ca857fc3b8a5a33d0f19797edc1d1331ef79ffd9dc86ced96303"
    sha256 cellar: :any_skip_relocation, catalina:       "afa69f51c57695ae2e01a3ad9a44690fa746e925129ab2809550811cafe0fb3f"
    sha256 cellar: :any_skip_relocation, mojave:         "af0e4194b84f969e0a701f32c102dd64a432f6f675e6913716b81b96e548d451"
    sha256 cellar: :any_skip_relocation, high_sierra:    "5be5ed82ad0b8669aef16942e39e9d60341ab6201ee019b9b997ab5ee4ea76b1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "e4f3c451b138c9ecdd2e00693369295093f73c4dd4e8fa00e8a316ab5605b543"
  end

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    assert_equal "7", shell_output("#{bin}/clac '3 4 +'").strip
  end
end
