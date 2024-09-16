class GithubNotifier < Formula
  desc "Get notified about review requests, new reviews, and check statuses"
  homepage "https://github.com/WassimBenzarti/github-notifier"
  url "https://github.com/WassimBenzarti/github-notifier/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "d1aabc827b58b0722d4230a6c0593f6156b03a6104e3bbb633822ee68fff4a50"
  license "MIT"
  head "https://github.com/WassimBenzarti/github-notifier.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-C", "cli/", *std_go_args(ldflags: "-s -w")
    bin.install "cli/github-notifier"
    generate_completions_from_executable(cli/"github-notifier", "completion")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/github-notifier version").strip
  end
end
