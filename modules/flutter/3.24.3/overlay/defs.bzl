
# flutter/defs.bzl

def _flutter_command_impl(ctx):
    ctx.actions.run_shell(
        command = " ".join([ctx.executable.flutter_tool.path] + ctx.attr.args),
        use_default_shell_env = True,
    )
    return DefaultInfo()

# Custom rule to run Flutter commands (e.g., build, run, doctor)
flutter_command = rule(
    implementation = _flutter_command_impl,
    attrs = {
        "args": attr.string_list(),  # Flutter command arguments (e.g., build apk)
        "flutter_tool": attr.label(
            executable = True,
            cfg="exec",
        ),
    },
)

