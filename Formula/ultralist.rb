class Ultralist < Formula
  desc "Simple GTD-style task management for the command-line"
  homepage "https://ultralist.io"
  url "https://github.com/ultralist/ultralist/archive/1.0.tar.gz"
  sha256 "c0c5ec731fdd5556de8996a29e13f19c90f25bbfc7c19a00abd2edbfd5068e28"
  license "MIT"

  bottle do
    cellar :any_skip_relocation
    sha256 "348ace8825a9b4c9ec9e170f3d7b2bd692fa1dc2505a2d377245195274e65a3b" => :catalina
    sha256 "1496e25ed7e4c74ca5b122913b944378f1c4b7413b482ff4e46d7c61dd1739c6" => :mojave
    sha256 "f741a37598348257902d05909b9751518e2b0c786ad0cdb135139deda2b035f6" => :high_sierra
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system bin/"ultralist", "init"
    assert_predicate testpath/".todos.json", :exist?
    add_task = shell_output("#{bin}/ultralist add learn the Tango")
    assert_match /Todo.* added/, add_task
  end
end
