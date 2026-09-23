class Ferry < Formula
  desc "Move a Claude Code session from one computer to another"
  homepage "https://github.com/lindsay-cheng/ferry"
  url "https://github.com/lindsay-cheng/ferry/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "4bc8c82b5813f3becb1a688d71c43e0f3975c48028b33d63275f52c64e49709d"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "mod", "download"
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd"
  end

  test do
    assert_match "ferry", shell_output("#{bin}/ferry --version")
  end
end
