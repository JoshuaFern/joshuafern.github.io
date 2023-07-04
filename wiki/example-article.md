---
title: "Making an F-Droid Repo"
date: 2022-07-03
description: "A rough guide to making an F-Droid Repository"
tags: repo, f-droid, android, repository
importance: 5
abstract: "Leave empty if you don't want to feature an abstract. "
---

Rough guide on making an F-Droid Repo

### Using GithubUserContent

I believe this method gives you around ~100GB of repo space but results in an odd quirk where visiting the repo's URL gives an `404: Not found` error.

* Create a new github repo, the name can be arbitrary.
* Rename the main/master branch to `fdroid`
* If you're using Nix, copy the `shell.nix` from this repo and run `nix-shell`, then `fdroid init`. If you're not using Nix you've got to setup your environment yourself.
* Use the `.gitignore` from this repo to prevent uploading the keys to the castle.
* Copy your APKs to the `repo` directory, they must be under 100MB. Avoid the free tier of Github's LFS unless your repo can fit in the meager limits.
* Edit the config.yml, specifically setting the repo name and URL. It won't work without this! The URL should look something like `https://raw.githubusercontent.com/alt-droid/alt-droid-foss/fdroid/repo` where `alt-droid` is your user/org name, `alt-droid-foss` is your repository's name, `fdroid` is your branch name and `repo` is the folder your repo is hosted.
* Run `fdroid update --create-metadata` and edit the skeleton metadata yml files in the metadata directory to your liking.
* Nearly done now, do a final `fdroid update` and simply `git add .`, `git commit`, `git push` your repo.
* Now to make a nice README.md or some other site to guide users how to install the repo.


### Using Github Pages

This method is a bit nicer in that it has a nice landing page when the URL is visited, but I believe the Github Pages limit for free accounts is only ~1GB, so this is only suitable for smaller repositories. 

* Create a new github repo, call it `fdroid` and `cd` into it.
* If you're using Nix, copy the shell.nix from this repo and run `nix-shell`, then `fdroid init`. If you're not using Nix you've got to setup your environment yourself.
* Use the `.gitignore` from this repo to prevent uploading the keys to the castle.
* Use the default configuration for deploying github pages through github actions.
* Copy your APKs to the `repo` directory, they must be under 100MB. Avoid the free tier of Github's LFS unless your repo can fit in the meager limits.
* Edit the config.yml file, specifically setting a repo name and github pages URL. It won't work without this!
* Run `fdroid update --create-metadata` and edit the skeleton metadata yml files in the metadata directory to your liking.
* Nearly done now, do a final `fdroid update` and run the github action to launch your static site.

## Resources

### Discovery

You can search itch by license, i.e.
https://itch.io/games/code-gpl2/platform-android

All the Pixel Dungeon Forks:
https://github.com/Dominowood371/Pixel-Dungeon

### Metadata

* [Build Metadata Reference](https://f-droid.org/docs/Build_Metadata_Reference/)
* [List of Licenses](https://gitlab.com/fdroid/fdroiddata/-/blob/master/stats/licenses.txt)


