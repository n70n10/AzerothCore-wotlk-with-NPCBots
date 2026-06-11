-- npcbots-player-cmds: register and grant the player hire/fire RBAC permissions.
--
-- Mirrors the existing npcbot RBAC convention: each command permission is
-- registered in rbac_permissions, then linked to parent permission 199 (the
-- player-facing npcbot command group) via rbac_linked_permissions.
--
-- Auto-applied by the worldserver/db-import updater. Accounts must re-login
-- (or the worldserver restart) after this applies, since RBAC permissions are
-- cached per session at login.

INSERT IGNORE INTO `rbac_permissions` (`id`, `name`) VALUES
    (70038, 'Command: npcbot hire'),
    (70039, 'Command: npcbot hireclass'),
    (70040, 'Command: npcbot fire');

INSERT IGNORE INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
    (199, 70038),
    (199, 70039),
    (199, 70040);
