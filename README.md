# FFMPEG Deiban 8, full support
ffmpeg working completely on debian 8 used with transcoding for subsonic.

_Side note_
Okay, so I installed ffmpeg package from deb multimedia and didn't work with my installation.
But note, this package is used by a docker container running subsonic, systemlinked to the machine...
For some reason transcoding wasn't working so I decided to compile it myself and try again.

Since I might fight this in the future, or someone else... here's a shortcut.

# Why ffmpeg, etc within the repo?
Yes I copied the sources since it was slightly complicated to be honest to
get all of them, plus SVN?... seriously?.
