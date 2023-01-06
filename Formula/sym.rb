class Sym < Formula
  desc "Symbiosis Managed Kubernetes CLI tool"
  homepage "https://github.com/symbiosis-cloud/cli"
  url "https://github.com/symbiosis-cloud/cli/archive/refs/tags/v0.0.9.tar.gz"
  sha256 "723ba738618f25072e0139ecf01efe07474e363b65299b2ae630fda9b36e5c54"
  license "Apache-2.0"
  head "https://github.com/symbiosis-cloud/cli.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -X github.com/symbiosis-cloud/cli/commands.Version=v#{version}
    ]

    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/sym"
  end

  test do
    assert_match "Symbiosis CLI version v#{version}", shell_output("#{bin}/sym version")
  end
end
