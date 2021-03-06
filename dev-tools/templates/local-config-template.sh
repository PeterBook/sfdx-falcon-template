#!/bin/sh
####################################################################################################
#
# FILENAME:     local-config-template.sh
#
# PURPOSE:      Template for creating a personalized local-config.sh file.
#
# DESCRIPTION:  All shell scripts in the dev-tools directory require several configuration values
#               to run correctly (eg. the path to your project's root directory or the alias of
#               the DevHub that you want to use.  These customizations can be specific to each
#               individual developer, and therefore should not be tracked by the project's VCS.
#
#               This file serves as a template that Release Managers can use to establish baseline
#               values for their project.  When individaul developers clone the repo and initialize
#               their local, personal version of the project this template is used to create a
#               customized local-config.sh file at <project-root>/dev-tools/lib/local-config.sh
#
# INSTRUCTIONS: 1. Inside of the dev-tools directory, execute the following command
#                  cp ./templates/local-config-template.sh ./lib/local-config.sh
#               2. Edit the default values in your local-config.sh to meet the needs of your local
#                  environment and project setup.
#
####################################################################################################
#
##
###
#### DEFINE LOCAL CONFIGURATION VARIABLES ##########################################################
###
##
#
# Alias for the Dev Hub that should be used when creating scratch orgs for this project.
# This is the ONE variable that will likely need to be customized for individual developers.
DEV_HUB_ALIAS="MyDevHub"

# Namespace Prefix.  Set to "force-app" if this project is not building a managed package.
NAMESPACE_PREFIX="force-app"

# Package Name.  Specified as part of the Package Detail info in your packaging org. 
# Surround this value with double-quotes if your package name contains space characters.
PACKAGE_NAME="My Managed Package"

# Metadata Package ID.  Refers to the metadata package as a whole.  Must begin with "033".
METADATA_PACKAGE_ID="033000000000000"

# Package Version ID. Refers to a specific, installable version of a package. Must begin with "04t".
PACKAGE_VERSION_ID="04t000000000000"

# Default Package Directory. Should match what is set in sfdx-project.json.
DEFAULT_PACKAGE_DIR_NAME="$NAMESPACE_PREFIX"

# Alias for the primary Scratch Org used by this project.
SCRATCH_ORG_ALIAS="$NAMESPACE_PREFIX-SCRATCH"

# Alias for the packaging org for this project.
PACKAGING_ORG_ALIAS="$NAMESPACE_PREFIX-PACKAGE"

# Alias for the subscriber test org used to test managed-beta package installs.
SUBSCRIBER_ORG_ALIAS="$NAMESPACE_PREFIX-SUBSCRIBER"

# Git Remote URI. SSH or HTTPS URI that points to the Git remote repo used by this project.
# GitHub is used as an example here, but any Git remote (ie. BitBucket) can be used.
GIT_REMOTE_URI="https://github.com/your-organization/your-repository-name.git"

# Location of the primary scratch-def.json file that should be used by SFDX-Falcon scripts that
# create scratch orgs (eg. rebuild-scratch-org).
SCRATCH_ORG_CONFIG="$PROJECT_ROOT/config/project-scratch-def.json"

# Echo the variables set by this script prior to exiting.  Specify "false" to suppress the
# display of local config that normally occurs when executing SFDX-Falcon based scripts.
ECHO_LOCAL_CONFIG_VARS="true"
#
##
###
#### ECHO ALL VARIABLES ############################################################################
###
##
#
if [ "$ECHO_LOCAL_CONFIG_VARS" = "true" ]; then
  echo "\n`tput setaf 7``tput bold`Local configuration variables set by `dirname $0`/lib/local-config.sh`tput sgr0`\n"
  echoConfigVariables
fi
##END##