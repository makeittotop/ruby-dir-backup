# encoding: utf-8

##
# Backup Generated: tactic_backup
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t tactic_backup [-c <path_to_configuration_file>]
#
# For more information about Backup's components, see the documentation at:
# http://meskyanichi.github.io/backup
#
Model.new(:tactic_backup, 'Description for tactic_backup') do
  ##
  # Archive [Archive]
  #
  # Adding a file or directory (including sub-directories):
  #   archive.add "/path/to/a/file.rb"
  #   archive.add "/path/to/a/directory/"
  #
  # Excluding a file or directory (including sub-directories):
  #   archive.exclude "/path/to/an/excluded_file.rb"
  #   archive.exclude "/path/to/an/excluded_directory
  #
  # By default, relative paths will be relative to the directory
  # where `backup perform` is executed, and they will be expanded
  # to the root of the filesystem when added to the archive.
  #
  # If a `root` path is set, relative paths will be relative to the
  # given `root` path and will not be expanded when added to the archive.
  #
  #   archive.root '/path/to/archive/root'
  #
  archive :my_archive do |archive|
    # Run the `tar` command using `sudo`
    # archive.use_sudo
    archive.add "/home/apache/tactic/"
    archive.exclude "/home/apache/tactic/README.md"
  end

  ##
  # Local (Copy) [Storage]
  #
  store_with Local do |local|
    local.path       = "/nas/projects/Tactic/backup/database/postgresDb/tactic_src_data/"
    local.keep       = 5
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip

  ##
  # Mail [Notifier]
  #
  # The default delivery method for Mail Notifiers is 'SMTP'.
  # See the documentation for other delivery options.
  #
  notify_by Mail do |mail|
    mail.on_success           = true
    mail.on_warning           = true
    mail.on_failure           = true

    mail.from                 = "a.pareek@barajoun.com"
    mail.to                   = "a.pareek@barajoun.com"
    mail.address              = "172.16.10.40"
    mail.port                 = 25
    mail.domain               = "barajoun.local"
    mail.user_name            = "abhishek"
    mail.password             = "qwerty"
    mail.authentication       = :LOGIN
    mail.encryption           = :none
  end

end
