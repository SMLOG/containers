#!/bin/bash
/usr/sbin/sshd
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
[ ! -d "${REPOS_DIR}" ] && /scripts/auto_ssh.sh && [ -n "$REPOS_DIR" ] && [ -n "$REMOTE_USER" ] &&[ -n "$REMOTE_HOST" ] && rsync -avz ${REMOTE_USER}@${REMOTE_HOST}:~/rsync_data/ ${REPOS_DIR}/&&/scripts/update_repos.sh || echo "Skipping rsync; source directory is not empty."

if [ -n "$REPOS_DIR" ]; then
	ls -l ${REPOS_DIR}
	chown -R root ${REPOS_DIR}
	git config --global user.email "you@example.com"
	git config --global user.name "Your Name"
	(test -d $REPOS_DIR && cd ${REPOS_DIR}&& chmod u+x ./start.sh&&./start.sh&)

fi

/bin/bash
