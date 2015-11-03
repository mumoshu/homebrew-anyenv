class Anyenv < Formula
  desc "anyenv - all in one for **env" if respond_to? :desc
  homepage "https://github.com/riywo/anyenv"
  # url "https://github.com/riywo/anyenv/archive/v1.0.0.tar.gz"
  # shasum -a 256 master.tar.gz
  # sha256 "b1c284f345027ecfa7d1e253c3e91bdfcab783696139763c79d446dd0969a0c3"
  head "https://github.com/riywo/anyenv.git"
  version "5693de4"

  def install
    inreplace "libexec/anyenv", %Q|ANYENV_ROOT="${HOME}/.anyenv"|, %Q|ANYENV_ROOT="#{prefix}"|
    prefix.install Dir["*"]
  end

  def caveats; <<-EOS.undent
    Add the following to the ~/.bashrc or ~/.zshrc file:

      echo 'eval "$(anyenv init -)"' >> ~/.your_profile
    EOS
  end

  test do
    shell_output("eval \"$(#{bin}/anyenv init -)\" && anyenv version")
  end
end
