class Sym < Formula
  desc "Symbiosis Managed Kubernetes CLI tool"
  homepage "https://github.com/symbiosis-cloud/cli"
  url "https://github.com/symbiosis-cloud/cli/archive/refs/tags/v0.0.10.tar.gz"
  sha256 "a855aecf1835a2ad7fb4be5d51015d9d027da3c96f29e2f325fb84552fefbcff"
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
