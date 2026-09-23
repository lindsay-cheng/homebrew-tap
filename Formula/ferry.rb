class Ferry < Formula
  desc "Move a Claude Code session from one computer to another"
  homepage "https://github.com/lindsay-cheng/ferry"
  url "https://github.com/lindsay-cheng/ferry/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "df9b089267d209ca927bb7b03bb025744e50ffe6ae2ff56161e136a26961a27c"
  license "MIT"

  depends_on "go" => :build

  def fetch
    system "go", "mod", "download"
  end

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/ferry"
  end

  test do
    assert_match "ferry", shell_output("#{bin}/ferry --version")
  end
end
