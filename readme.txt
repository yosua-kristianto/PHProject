//-------------------------------
CREATED	: 1:41 AM 2/14/2019
AUTHOR	: YOSUA KRISTIANTO

CHANGE LOG:
1# Edited 'action' into 'repo'
2# Fixed Password errors to MD5 Functions
3# Fixing Dummies Data
4# Moving connection.php inside 'util' folder
5# Fixing repo/doLogin.php
	--Converting $password to md5
	--Adding SQL-Escape Functions
	--Adding Session
	--Deleted Session at last row
6# Edit and Adding functions at index.php
	--Adding Session validation. index.php now only accessible during logged in. Otherwise, redirect to login.php
	--Adding some little salt functions
	--Update: Now index.php has Dynamic Title! Check the bottom php script :)
	--Edit the inline CSS, moving it as internal CSS
	--Adding pre-upload image box.
	--Adding jQuery Scripts for image box.
7# Added doLogout.php
8# Editing login.php
	--Adding Session validation. login.php now now only accessible during logged out. Otherwise, redirect to index.php
	--Adding Error Message via URL header
	--Adding Register anchor
9# Adding register.php
	--Adding Session validation. register.php now now only accessible during logged out. Otherwise, redirect to index.php
	--Added form that include Username, Password, Confirm Password
10# Adding repo/register.php
	--Adding SQL-Prepare Statement
	--Auto Login after Registering
11# Adding styles/global.css for views.
12# Editing Storage
13# Adding repo/doPosting.php
	--Still got error on $Query
14# Edited Query on doPosting.php
	--Logical Query Error Fixed
	--Logical move_file function error fixed
15# Added dashboard.php
	--Don't force me to do UI design here 
16# Added doLike.php and doComment.php