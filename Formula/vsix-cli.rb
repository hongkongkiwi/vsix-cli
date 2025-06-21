class VsixCli < Formula
  desc "Download VS Code extensions (.vsix files) from official or open-source marketplaces"
  homepage "https://github.com/hongkongkiwi/vsix-cli"
  url "https://github.com/hongkongkiwi/vsix-cli/releases/download/v4.0.1/vsix-cli"
  version "4.0.1"
  sha256 "PLACEHOLDER_SHA256"
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