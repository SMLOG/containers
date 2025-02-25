#!/bin/bash
if [ ! -f "$HOME/.ssh/id_rsa" ]; then
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -N "" -f "$HOME/.ssh/id_rsa"
	if [ -n "$REMOTE_USER" ]; then
		echo ${REMOTE_USER}@${REMOTE_HOST}
		ssh-copy-id ${REMOTE_USER}@${REMOTE_HOST}
		ssh "$REMOTE_USER@${REMOTE_HOST}" "echo 'SSH connection successful!'"
	fi
fi




