# make sure you run this as administrator

# install chocolatey
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

# install vagrant and virtualbox
cinst vagrant virtualbox