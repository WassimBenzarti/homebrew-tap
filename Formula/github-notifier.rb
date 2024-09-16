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

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e2f1ca3721368cc939f501a0a8fe3df0d50693107820b8d66a97e3ca691df568"
  end

  depends_on "go" => :build

  def install
    chdir "cli" do
      system "go", "build", *std_go_args(ldflags: "-s -w")
    end
    # bin.install bin/"github-notifier"
    generate_completions_from_executable(bin/"github-notifier", "completion")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/github-notifier version").strip
  end
end
