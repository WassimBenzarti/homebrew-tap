class GithubNotifier < Formula
  desc "Boost your productivity with instant alerts for PR activities. Get notified about review requests, new reviews, and check statuses. Minimize wait times and stay informed about your team's GitHub activity in real-time"
  homepage ""
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/WassimBenzarti/github-notifier/releases/download/v0.0.1/github-notifier-darwin-arm64.gz"
    end
    if Hardware::CPU.intel?
      url "https://github.com/WassimBenzarti/github-notifier/releases/download/v0.0.1/github-notifier-darwin-amd64.gz"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/WassimBenzarti/github-notifier/releases/download/v0.0.1/github-notifier-linux-arm64.gz"
    end
    if Hardware::CPU.intel?
      url "https://github.com/WassimBenzarti/github-notifier/releases/download/v0.0.1/github-notifier-linux-amd64.gz"
    end
    
  end

  def install
    bin.install "github-notifier"
  end

  test do
    system bin/"github-notifier"
  end
end
