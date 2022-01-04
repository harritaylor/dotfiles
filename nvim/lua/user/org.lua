local status_ok, org = pcall(require, "org")
if not status_ok then
  return
end

org.setup {
  org_agenda_files = {'~/Dropbox/org/*'},
  org_default_notes_file = '~/Dropbox/org/notes.org',
}
