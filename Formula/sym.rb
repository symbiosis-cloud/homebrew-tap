class Sym < Formula
  desc "Symbiosis Managed Kubernetes CLI tool"
  homepage "https://github.com/symbiosis-cloud/cli"
  url "https://github.com/symbiosis-cloud/cli/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "b9d385b0b7685b6208bcda8bee6691265867d70b4c531761ba559076f0a93885"
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

