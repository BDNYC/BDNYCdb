CREATE TABLE "changelog" (
	`id`	INTEGER NOT NULL UNIQUE,
	`date`	TEXT,
	`user`	TEXT,
	`machine_name`	TEXT,
	`modified_tables`	TEXT,
	`user_description`	TEXT,
	`filename`	TEXT,
	PRIMARY KEY(id)
);
CREATE TABLE "ignore" (
	`id`	INTEGER NOT NULL UNIQUE,
	`id1`	INTEGER NOT NULL,
	`id2`	INTEGER NOT NULL,
	`tablename`	TEXT NOT NULL,
	PRIMARY KEY(id)
);
CREATE TABLE "modes" (
	`id`	INTEGER NOT NULL UNIQUE,
	`mode`	TEXT NOT NULL,
	PRIMARY KEY(id)
);
CREATE TABLE "systems" (
	`id`	INTEGER NOT NULL UNIQUE,
	`name`	TEXT NOT NULL,
	PRIMARY KEY(id)
);
CREATE TABLE publications (
    id INTEGER NOT NULL UNIQUE,
    bibcode TEXT ,
    shortname TEXT UNIQUE NOT NULL,
    DOI TEXT ,
    description TEXT ,
    PRIMARY KEY(id, shortname)
);
CREATE TABLE instruments (
    id INTEGER NOT NULL UNIQUE,
    name TEXT NOT NULL,
    publication_shortname TEXT ,
    PRIMARY KEY(id),
    FOREIGN KEY (publication_shortname) REFERENCES publications (shortname) ON UPDATE CASCADE
);
CREATE TABLE telescopes (
    id INTEGER NOT NULL UNIQUE,
    name TEXT NOT NULL,
    publication_shortname TEXT ,
    PRIMARY KEY(id),
    FOREIGN KEY (publication_shortname) REFERENCES publications (shortname) ON UPDATE CASCADE
);
CREATE TABLE data_requests (
    id INTEGER NOT NULL UNIQUE,
    source_id NUMERIC NOT NULL,
    source TEXT ,
    data_request TEXT ,
    purpose TEXT ,
    PRIMARY KEY(id),
    FOREIGN KEY (source_id) REFERENCES sources (id) ON UPDATE CASCADE
);
CREATE TABLE versions (
    id INTEGER NOT NULL,
    version REAL UNIQUE NOT NULL,
    date_published TEXT,
    publication_shortname TEXT,
    comment TEXT,
    PRIMARY KEY(id),
    FOREIGN KEY (publication_shortname) REFERENCES publications (shortname) ON UPDATE CASCADE
);
CREATE TABLE sources (
    id INTEGER NOT NULL UNIQUE,
    ra REAL ,
    dec REAL ,
    designation TEXT ,
    publication_shortname TEXT ,
    unum TEXT ,
    shortname TEXT ,
    names TEXT ,
    components TEXT ,
    companions TEXT ,
    comments TEXT ,
    version REAL ,
    PRIMARY KEY(id),
    FOREIGN KEY (publication_shortname) REFERENCES publications (shortname) ON UPDATE CASCADE
);
CREATE TABLE photometry (
    id INTEGER NOT NULL UNIQUE,
    source_id INTEGER NOT NULL,
    band TEXT NOT NULL,
    magnitude REAL NOT NULL,
    magnitude_unc REAL ,
    system_id INTEGER ,
    telescope_id INTEGER ,
    instrument_id INTEGER ,
    publication_shortname TEXT ,
    epoch TEXT ,
    comments TEXT ,
    version REAL ,
    PRIMARY KEY(id),
    FOREIGN KEY (system_id) REFERENCES systems (id) ON UPDATE CASCADE,
    FOREIGN KEY (instrument_id) REFERENCES instruments (id) ON UPDATE CASCADE,
    FOREIGN KEY (telescope_id) REFERENCES telescopes (id) ON UPDATE CASCADE,
    FOREIGN KEY (publication_shortname) REFERENCES publications (shortname) ON UPDATE CASCADE,
    FOREIGN KEY (source_id) REFERENCES sources (id) ON UPDATE CASCADE
);
CREATE TABLE spectral_types (
    id INTEGER NOT NULL UNIQUE,
    source_id INTEGER NOT NULL,
    spectral_type REAL NOT NULL,
    spectral_type_unc REAL,
    gravity TEXT,
    suffix TEXT,
    regime TEXT,
    publication_shortname TEXT,
    adopted INTEGER,
    comments TEXT,
    version REAL,
    gravity_publication TEXT,
    PRIMARY KEY(id),
    FOREIGN KEY (publication_shortname) REFERENCES publications (shortname) ON UPDATE CASCADE,
    FOREIGN KEY (gravity_publication) REFERENCES publications (shortname) ON UPDATE CASCADE,
    FOREIGN KEY (source_id) REFERENCES sources (id) ON UPDATE CASCADE
);
CREATE TABLE parallaxes (
    id INTEGER NOT NULL UNIQUE,
    source_id INTEGER NOT NULL,
    parallax REAL NOT NULL,
    parallax_unc REAL ,
    publication_shortname TEXT ,
    adopted INTEGER ,
    comments TEXT ,
    version REAL ,
    PRIMARY KEY(id),
    FOREIGN KEY (publication_shortname) REFERENCES publications (shortname) ON UPDATE CASCADE,
    FOREIGN KEY (source_id) REFERENCES sources (id) ON UPDATE CASCADE
);
CREATE TABLE proper_motions (
    id INTEGER NOT NULL UNIQUE,
    source_id INTEGER NOT NULL,
    proper_motion_ra REAL NOT NULL,
    proper_motion_ra_unc REAL ,
    proper_motion_dec REAL NOT NULL,
    proper_motion_dec_unc REAL ,
    V_tan REAL ,
    V_tan_unc REAL ,
    publication_shortname TEXT ,
    comments TEXT ,
    version REAL ,
    PRIMARY KEY(id),
    FOREIGN KEY (publication_shortname) REFERENCES publications (shortname) ON UPDATE CASCADE,
    FOREIGN KEY (source_id) REFERENCES sources (id) ON UPDATE CASCADE
);
CREATE TABLE radial_velocities (
    id INTEGER NOT NULL UNIQUE,
    source_id INTEGER NOT NULL,
    radial_velocity REAL NOT NULL,
    radial_velocity_unc REAL ,
    spectrum_id INTEGER ,
    publication_shortname TEXT ,
    comments TEXT ,
    version REAL ,
    PRIMARY KEY(id),
    FOREIGN KEY (spectrum_id) REFERENCES spectra (id) ON UPDATE CASCADE,
    FOREIGN KEY (publication_shortname) REFERENCES publications (shortname) ON UPDATE CASCADE,
    FOREIGN KEY (source_id) REFERENCES sources (id) ON UPDATE CASCADE
);
CREATE TABLE spectra (
	id INTEGER NOT NULL UNIQUE, 
	source_id INTEGER NOT NULL, 
	spectrum SPECTRUM NOT NULL, 
	wavelength_units TEXT , 
	flux_units TEXT , 
	wavelength_order INTEGER , 
	regime TEXT , 
	publication_shortname TEXT , 
	obs_date TEXT , 
	instrument_id INTEGER , 
	telescope_id INTEGER , 
	mode_id INTEGER , 
	filename TEXT , 
	comments TEXT , 
	best INTEGER , 
	version REAL , 
	local_spectrum SPECTRUM , 
	PRIMARY KEY(id), 
	FOREIGN KEY (source_id) REFERENCES sources (id) ON UPDATE CASCADE, 
	FOREIGN KEY (publication_shortname) REFERENCES publications (shortname) ON UPDATE CASCADE, 
	FOREIGN KEY (telescope_id) REFERENCES telescopes (id) ON UPDATE CASCADE, 
	FOREIGN KEY (instrument_id) REFERENCES instruments (id) ON UPDATE CASCADE, 
	FOREIGN KEY (mode_id) REFERENCES modes (id) ON UPDATE CASCADE 
);
