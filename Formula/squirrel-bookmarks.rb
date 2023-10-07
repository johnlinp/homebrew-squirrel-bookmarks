class SquirrelBookmarks < Formula
  include Language::Python::Virtualenv
  desc "Bookmark system between development branches."
  homepage "https://github.com/johnlinp/squirrel-bookmarks"
  url "https://files.pythonhosted.org/packages/23/4f/4212b6db2f4f170e086f638f4fc190edc114bf5884cab9d08a4c28cdbe6a/squirrel-bookmarks-0.1.9.tar.gz"
  version "0.1.9"
  sha256 "40867c1cb9dc407189e240374ae4b4db8ed2634062ca849bdf4e91b186b82c02"

  depends_on "python@3.9"

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/cd/e5/af35f7ea75cf72f2cd079c95ee16797de7cd71f29ea7c68ae5ce7be1eda0/PyYAML-6.0.1.tar.gz"
    sha256 "bfdf460b1736c775f2ba9f6a92bca30bc2095067b8a9d77876d1fad6cc3b4a43"
  end

  def install
    virtualenv_install_with_resources

    bash_completion.install "etc/bash_completion.d/sq"
    bash_completion.install "etc/bash_completion.d/squirrel"
  end

  test do
    system bin/"squirrel", "--help"
  end
end
