class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1035.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1035.0/snyk-macos"
    sha256 "669eff4b235d3bffc146b3676dcbc2dd7bf4e72946845765f978c56a280aa0e7"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1035.0/snyk-linux"
    sha256 "a1e182984d515f692a571182cb1246e6a30071cb93d95a2a7c9b2c125966a4e9"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
