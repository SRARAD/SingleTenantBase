package com.sra

class DBBackupJob {
	static triggers = {
		simple startDelay: 30000, repeatInterval: 60000
	}
	
	def DBBackupService

	def checkBackup() {
		if (DBBackupService.dirty) {
			DBBackupService.s3Backup()
			DBBackupService.dirty=false
		}
	}

	def execute() {
		checkBackup()
	}
}
