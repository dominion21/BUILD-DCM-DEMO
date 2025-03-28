create or alter schema GIT_INTEGRATION;
-- create the git secret
create secret GIT_SECRET
  type = password
  username = dominion21
  password = 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    
;

-- use the ACCOUNTADMIN role to create an API integration to keep the exercise simple
-- otherwise, create a custom role and grant it the CREATE INTEGRATION ON ACCOUNT privilege
use role ACCOUNTADMIN;
-- create an API integration with the Git account
create or replace api integration GIT_API_INTEGRATION
  API_PROVIDER = git_https_api
-- replace your Git account in the next line (example 'https://github.com/mferle')
  API_ALLOWED_PREFIXES = ('https://github.com/dominion21')
  ALLOWED_AUTHENTICATION_SECRETS = (GIT_SECRET)
  ENABLED = TRUE;

-- grant usage on the integration to the SYSADMIN role
grant usage on integration GIT_API_INTEGRATION to role SYSADMIN;
grant usage on database DevOps to role SYSADMIN;
-- continue to use the SYSADMIN role to keep the exercise simple
-- otherwise, create a custom role and grant it the CREATE GIT REPOSITORY ON SCHEMA privilege
use role SYSADMIN;
-- create a Git repository using the API integration and the secret
create or replace  git repository demo_repo
  api_integration = GIT_API_INTEGRATION
  git_credentials = GIT_SECRET
-- replace the URL to your repository in the next line
  ORIGIN = 'https://github.com/dominion21/BUILD-DCM-DEMO.git'; 

list @demo_repo/branches/main; show tables; show stages;

-- show branches in the Git repository
show git branches in demo_repo;

-- list the files in the repository main branch   DEV.GIT_INTEGRATION.AUTHORS
ls @demo_repo/branches/main;

-- fetch the latest from the Git repository
alter git repository demo_repo fetch;
