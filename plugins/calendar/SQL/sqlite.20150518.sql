CREATE TABLE vevent_tmp (
  'event_id' integer NOT NULL PRIMARY KEY,
  'calendar_id' integer NOT NULL DEFAULT 0,
  'recurrence_id' integer NOT NULL DEFAULT 0,
  'exception' datetime NULL,
  'exdate' datetime NULL,
  'uid' varchar(255) NOT NULL DEFAULT '',
  'created' datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  'changed' datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  'sequence' integer NOT NULL DEFAULT 0,
  'start' datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  'end' datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  'recurrence' text DEFAULT NULL,
  'title' varchar(255) NOT NULL,
  'description' text NOT NULL,
  'location' varchar(255) NOT NULL DEFAULT '',
  'categories' text NOT NULL DEFAULT '',
  'url' varchar(255) NOT NULL DEFAULT '',
  'all_day' smallint NOT NULL DEFAULT 0,
  'free_busy' smallint NOT NULL DEFAULT 0,
  'priority' smallint NOT NULL DEFAULT 0,
  'sensitivity' smallint NOT NULL DEFAULT 0,
  'alarms' varchar(255) DEFAULT NULL,
  'attendees' text DEFAULT NULL,
  'notifyat' datetime DEFAULT NULL,
  'del' smallint NOT NULL DEFAULT 0,
  'dismissed' DATETIME NULL,
  'tzname' VARCHAR(255) DEFAULT NULL,
  'duration' varchar(10) NOT NULL DEFAULT '0'
);

INSERT INTO vevent_tmp (
	'event_id',
	'calendar_id',
	'recurrence_id',
	'exception',
	'exdate',
	'uid',
	'created',
	'changed',
	'sequence',
	'start',
	'end',
	'recurrence',
	'title',
	'description',
	'location',
	'categories',
	'url',
	'all_day',
	'free_busy',
	'priority',
	'sensitivity',
	'alarms',
	'attendees',
	'notifyat',
	'del',
	'dismissed',
	'tzname',
	'duration'
)
SELECT
	'event_id',
	'calendar_id',
	'recurrence_id',
	'exception',
	'exdate',
	'uid',
	'created',
	'changed',
	'sequence',
	'start',
	'end',
	'recurrence',
	'title',
	'description',
	'location',
	'categories',
	'url',
	'all_day',
	'free_busy',
	'priority',
	'sensitivity',
	'alarms',
	'attendees',
	'notifyat',
	'del',
	'dismissed',
	'tzname',
	'duration'
FROM vevent;

DROP TABLE vevent;
CREATE TABLE vevent (
  'event_id' integer NOT NULL PRIMARY KEY,
  'calendar_id' integer NOT NULL DEFAULT 0,
  'recurrence_id' integer NOT NULL DEFAULT 0,
  'exception' datetime NULL,
  'exdate' datetime NULL,
  'uid' varchar(255) NOT NULL DEFAULT '',
  'created' datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  'changed' datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  'sequence' integer NOT NULL DEFAULT 0,
  'start' datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  'end' datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  'recurrence' text DEFAULT NULL,
  'title' varchar(255) NOT NULL,
  'description' text NOT NULL,
  'location' varchar(255) NOT NULL DEFAULT '',
  'categories' text NOT NULL DEFAULT '',
  'url' varchar(255) NOT NULL DEFAULT '',
  'all_day' smallint NOT NULL DEFAULT 0,
  'free_busy' smallint NOT NULL DEFAULT 0,
  'priority' smallint NOT NULL DEFAULT 0,
  'sensitivity' smallint NOT NULL DEFAULT 0,
  'alarms' varchar(255) DEFAULT NULL,
  'attendees' text DEFAULT NULL,
  'notifyat' datetime DEFAULT NULL,
  'del' smallint NOT NULL DEFAULT 0,
  'dismissed' DATETIME NULL,
  'tzname' VARCHAR(255) DEFAULT NULL,
  'duration' varchar(10) NOT NULL DEFAULT '0',
  FOREIGN KEY (calendar_id) REFERENCES calendars (calendar_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE INDEX vevent_uid_idx ON vevent (uid);
CREATE INDEX vevent_recurrence_idx ON vevent (recurrence_id);
CREATE INDEX vevent_calendar_notify_idx ON vevent (calendar_id, notifyat);

INSERT INTO vevent (
	'event_id',
	'calendar_id',
	'recurrence_id',
	'exception',
	'exdate',
	'uid',
	'created',
	'changed',
	'sequence',
	'start',
	'end',
	'recurrence',
	'title',
	'description',
	'location',
	'categories',
	'url',
	'all_day',
	'free_busy',
	'priority',
	'sensitivity',
	'alarms',
	'attendees',
	'notifyat',
	'del',
	'dismissed',
	'tzname',
	'duration'
)
SELECT
	'event_id',
	'calendar_id',
	'recurrence_id',
	'exception',
	'exdate',
	'uid',
	'created',
	'changed',
	'sequence',
	'start',
	'end',
	'recurrence',
	'title',
	'description',
	'location',
	'categories',
	'url',
	'all_day',
	'free_busy',
	'priority',
	'sensitivity',
	'alarms',
	'attendees',
	'notifyat',
	'del',
	'dismissed',
	'tzname',
	'duration'
FROM vevent_tmp;

DROP TABLE vevent_tmp;

UPDATE system SET value = 'initial|20141113|20141122|20141123|20141125|20141205|20141231|20150107|20150128|20150206|20150228|20150319|20150329|20150417|20150429|20150503|20150504|20150518' WHERE name = 'myrc_calendar';