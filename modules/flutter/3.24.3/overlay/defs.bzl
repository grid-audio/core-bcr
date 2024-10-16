
# flutter/defs.bzl

def _flutter_command_impl(ctx):
    # Run the specified Flutter command
    ctx.actions.run(
        arguments = ctx.attr.args,
        executable = ctx.executable._flutter_tool,
        use_default_shell_env = True,
    )

    return []

# Custom rule to run Flutter commands (e.g., build, run, doctor)
flutter_command = rule(
    implementation = _flutter_command_impl,
    attrs = {
        "args": attr.string_list(),  # Flutter command arguments (e.g., build apk)
        "_flutter_tool": attr.label(
            executable = True,
            default = Label("@flutter//bin:flutter"),  # Directly reference the flutter tool in bin/ directory
        ),
    },
)

