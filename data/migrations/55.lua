function onUpdateDatabase()
	print("> Updating database to version 55 (WorldPosition - float creature positioning)")

	db.query([[
		ALTER TABLE `players`
			ADD COLUMN `world_posx` FLOAT NOT NULL DEFAULT 0 AFTER `posz`,
			ADD COLUMN `world_posy` FLOAT NOT NULL DEFAULT 0 AFTER `world_posx`;
	]])

	db.query([[
		UPDATE `players`
		SET `world_posx` = `posx` + 0.5,
		    `world_posy` = `posy` + 0.5
		WHERE `posx` > 0 AND `posy` > 0;
	]])

	return true
end
