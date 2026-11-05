# Project instructions

## Screenshots

- Use `./screenshot.sh [output.png] [editor arguments...]` to capture the app.
- The script uses the existing release executable and a private Xvfb display.
- Each successful capture also refreshes `resources/darkmoon-studio-screenshot.png`,
  which is embedded in `README.md`, including when a custom output path is used.
- Do not build the app just to take a screenshot.

## Deploy requests

- When the user asks to deploy, create a new Git version tag for the deployed commit.
- If no version tags exist, start at `v0.0.1`.
- Otherwise, increment the highest existing stable semantic version by one patch
  unless the user specifies another version or a minor/major increment.
- Check local and remote tags before choosing the version. Accept existing stable
  tags with or without a `v` prefix; use `v` for new tags.
- Create an annotated tag. Never move or overwrite an existing tag.
- A request to define this workflow does not itself request a deployment or tag.
