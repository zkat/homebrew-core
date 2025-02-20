class Bork < Formula
  desc "Bash-Operated Reconciling Kludge"
  homepage "https://bork.sh/"
  url "https://github.com/borksh/bork/archive/v0.13.0.tar.gz"
  sha256 "5eaca1ebd984121df008b93c43ac259a455db7ccf13da1b1465d704e1faab563"
  license "Apache-2.0"
  head "https://github.com/borksh/bork.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "1973171521215e6fbf67df75dd80a1cd336c26430b28edc6bd8489c0a0ed2952"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "9fd828ce87277cc3e9a312b56869e87156fa56ec1d6ec8649ad76192f447f25a"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "29526cc2119003d1e1957071f35dd01ef782d8d2615b390768715a39d17b584c"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "29526cc2119003d1e1957071f35dd01ef782d8d2615b390768715a39d17b584c"
    sha256 cellar: :any_skip_relocation, sonoma:         "7f4476e40d15eb531ec1e545db155eaa137d8531ff2db1d4dbf39fd3e7db0a9b"
    sha256 cellar: :any_skip_relocation, ventura:        "41510ecf16c4671eea3f4c2ddf260bdeb0db6aa2302a8024ba145045e86c8311"
    sha256 cellar: :any_skip_relocation, monterey:       "35d2509202037bd1846d5ed0a607aebae76eb8a95782f09dfed1f7ba35577b60"
    sha256 cellar: :any_skip_relocation, big_sur:        "35d2509202037bd1846d5ed0a607aebae76eb8a95782f09dfed1f7ba35577b60"
    sha256 cellar: :any_skip_relocation, catalina:       "35d2509202037bd1846d5ed0a607aebae76eb8a95782f09dfed1f7ba35577b60"
    sha256 cellar: :any_skip_relocation, mojave:         "35d2509202037bd1846d5ed0a607aebae76eb8a95782f09dfed1f7ba35577b60"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "29526cc2119003d1e1957071f35dd01ef782d8d2615b390768715a39d17b584c"
  end

  def install
    files = %w[types/shells.sh types/pipsi.sh types/cask.sh test/type-pipsi.bats test/type-cask.bats]
    inreplace files, "/usr/local/", HOMEBREW_PREFIX

    man1.install "docs/bork.1"
    prefix.install %w[bin lib test types]
  end

  test do
    expected_output = "checking: directory #{testpath}/foo\r" \
                      "missing: directory #{testpath}/foo           \n" \
                      "verifying : directory #{testpath}/foo\n" \
                      "* success\n"
    assert_match expected_output, shell_output("#{bin}/bork do ok directory #{testpath}/foo", 1)
  end
end
