package com.sra

import grails.util.Environment

import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.h2.tools.Script
import org.hibernate.cfg.Configuration
import org.hibernate.event.Initializable
import org.hibernate.event.PostDeleteEvent
import org.hibernate.event.PostDeleteEventListener
import org.hibernate.event.PostInsertEvent
import org.hibernate.event.PostInsertEventListener
import org.hibernate.event.PostUpdateEvent
import org.hibernate.event.PostUpdateEventListener

import com.amazonaws.auth.AWSCredentials
import com.amazonaws.auth.BasicAWSCredentials
import com.amazonaws.services.s3.AmazonS3Client

class MyListener implements PostInsertEventListener, PostUpdateEventListener, PostDeleteEventListener, Initializable {
	
			public void onPostInsert(final PostInsertEvent event) {
				println("***Saw insert")
				DBBackupService.dirty=true
				return
			}
	
			public void onPostUpdate(final PostUpdateEvent event) {
				println("***Saw update")
				DBBackupService.dirty=true
				return
			}
	
			public void onPostDelete(final PostDeleteEvent event) {
				println("***Saw delete")
				DBBackupService.dirty=true
				return
			}
	
			public void initialize(final Configuration config) {
				return
			}
}

class DBBackupService {
	
	def grailsApplication = ApplicationHolder.application
	public static boolean dirty=false
	def stem="sample" //change to appropriate string for your project (use lowercase)
	
	private addEventTypeListener(listeners, listener, type) {
		def typeProperty = "${type}EventListeners"
		def typeListeners = listeners."${typeProperty}"
	
		def expandedTypeListeners = new Object[typeListeners.length + 1]
		System.arraycopy(typeListeners, 0, expandedTypeListeners, 0, typeListeners.length)
		expandedTypeListeners[-1] = listener
	
		listeners."${typeProperty}" = expandedTypeListeners
	}
	
	def registerListener() {
		def listeners = grailsApplication.mainContext.sessionFactory.eventListeners
		def listener = new MyListener()
	
		['postInsert', 'postUpdate', 'postDelete'].each({
		   addEventTypeListener(listeners, listener, it)
		})
	}
	
    def s3Backup() {
		Environment env=Environment.getCurrent();
		def bucketName=""
		switch(env) {
			case Environment.DEVELOPMENT:
				bucketName=stem+"-db-backups-dev";
				break;
			case Environment.PRODUCTION:
				bucketName=stem+"-db-backups-prod";
				break;
			case Environment.TEST:
				bucketName=stem+"-db-backups-test";
				break;
			default:
				bucketName=stem+"-db-backups-misc";
				break;
		}
		def dburl=grailsApplication.config.dataSource.url
		def dbuser=grailsApplication.config.dataSource.username
		def dbpass=grailsApplication.config.dataSource.password
		Script dbScript=new Script()
		ByteArrayOutputStream stream=new ByteArrayOutputStream();
		AmazonS3Client client=new AmazonS3Client() //assume an instance role with ability to create and write S3 buckets
		if (!client.doesBucketExist(bucketName)) {
			client.createBucket(bucketName);
		}
		File temp=File.createTempFile(stem+"db",".sql")
		String filename=temp.absolutePath
		dbScript.execute(dburl,dbuser,dbpass,filename)
		def formatDate=(new Date()).format("yyMMdd-HHmmss-SSS")
		def name=stem+"DB"+formatDate+".sql.txt"
		println("DB Backed Up to S3 Bucket:"+bucketName+" File:"+name)
		client.putObject(bucketName,name,temp)
		client.putObject(bucketName,stem+"DBLast.sql.txt",temp)
		temp.delete()
    }

}
