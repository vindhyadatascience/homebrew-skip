# Vindhya Data Science build of the Skip CLI (skiptools/skip cask structure, macOS only).
# The binary is built from https://github.com/vindhyadatascience/skipstone at tag
# "#{version}" (AGPL-3.0; that tag is the corresponding source). It replaces the
# skiptools/skip cask: uninstall that first (`brew uninstall --cask skip`).
cask "skip" do
  version "1.9.19-vds.7"
  sha256 "63a16b6b31566b19532866dcbe16bfcea637d50cb20836c55966f57e4c4c523a"

  url "https://github.com/vindhyadatascience/skipstone/releases/download/#{version}/skip-macos.zip"
  name "Skip (VDS build)"
  desc "Tool for creating and building universal swift apps (Vindhya Data Science build)"
  homepage "https://github.com/vindhyadatascience/skipstone"

  depends_on formula: "swiftly"
  depends_on formula: "openjdk"
  depends_on formula: "gradle"
  depends_on cask: "android-commandlinetools"

  binary "skip.artifactbundle/bin/skip"

  postflight_steps do
    # awaiting https://github.com/swiftlang/swiftly/pull/503
    run "opt/swiftly/bin/swiftly",
        base:           :homebrew_prefix,
        args:           ["init", "--assume-yes", "--no-modify-profile", "--skip-install"],
        # swiftly init creates ~/.swiftly, ~/.swiftly/bin and the toolchains
        # dir; declare ~/Library/Developer so it can create Toolchains inside
        # it even when the Developer dir does not exist yet
        writable_paths: [".swiftly", "Library/Developer"],
        writable_base:  :home
    run "skip.artifactbundle/bin/skip",
        base: :staged_path,
        args: ["welcome", "--first-run"]
  end
end
