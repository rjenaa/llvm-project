; RUN: %lli_mcjit -extra-modules=%p/cross-module-b.ir  -disable-lazy-compilation=true -remote-mcjit -mcjit-remote-process=lli-child-target -relocation-model=pic -code-model=small %s > /dev/null

declare i32 @FB()

define i32 @FA() {
  ret i32 0
}

define i32 @main() {
  %r = call i32 @FB( )   ; <i32> [#uses=1]
  ret i32 %r
}

