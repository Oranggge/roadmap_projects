A very simple script created for the [roadmap project](https://roadmap.sh/projects/log-archive-tool).

- Archives the given directory and saves the archive in the same folder as the script with the name `logs_archive_YYYYMMDD_HHMMSS.tar.gz`.
- Prints whether the operation was successful or not.
- If the archiving fails, it deletes any partial archive.
- Checks that the given path is an existing directory (and not a file).

