class Ferry < Formula
  desc "Move a Claude Code session from one computer to another"
  homepage "https://github.com/lindsay-cheng/ferry"
  url "https://github.com/lindsay-cheng/ferry/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "5605a11d654771515b7139f255cd4e7f7e33a65de10bfa1dde804cc29f232b38"
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
