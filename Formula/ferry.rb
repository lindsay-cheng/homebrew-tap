class Ferry < Formula
  desc "Move a Claude Code session from one computer to another"
  homepage "https://github.com/lindsay-cheng/ferry"
  url "https://github.com/lindsay-cheng/ferry/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "ef64b2846532523f05e102154d983b112873b76639af50c22fcefc5fcc7af051"
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
