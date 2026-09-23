class Ferry < Formula
  desc "Move a Claude Code session from one computer to another"
  homepage "https://github.com/lindsay-cheng/ferry"
  url "https://github.com/lindsay-cheng/ferry/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "19c795aedd91d81547005b3c1b2f1b30e51523233abe2d5eda44b2204c2adbb7"
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
