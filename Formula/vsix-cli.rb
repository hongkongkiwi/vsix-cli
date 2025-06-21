class VsixCli < Formula
  desc "Download VS Code extensions (.vsix files) from official or open-source marketplaces"
  homepage "https://github.com/hongkongkiwi/vsix-cli"
  url "https://github.com/hongkongkiwi/vsix-cli/releases/download/v4.0.1/vsix-cli"
  version "4.0.1"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on "bash"
  depends_on "curl"
  depends_on "jq"

  def install
    bin.install "vsix-cli"
  end

  test do
    system "#{bin}/vsix-cli", "--version"
    system "#{bin}/vsix-cli", "--help"
  end
end 