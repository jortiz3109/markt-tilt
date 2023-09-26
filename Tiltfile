load('ext://dotenv', 'dotenv')
load('ext://helm_resource', 'helm_resource', 'helm_repo')

allow_k8s_contexts(['default', 'minikube', 'docker-desktop'])
docker_prune_settings(False, max_age_mins=360, interval_hrs=1, keep_recent=1)
update_settings(max_parallel_updates=3)

configValues = read_yaml('config.yaml')

watch_settings([
    str(configValues['paths']['api']) + '/storage',
    str(configValues['paths']['api']) + '/vendor',
    str(configValues['paths']['api']) + '/.gitignore',
    str(configValues['paths']['web']) + '/node_modules',
    str(configValues['paths']['web']) + '/.gitignore'
])

k8s_yaml('./ingress/ingress-nginx.yaml')
k8s_resource(new_name='ingress-markt', objects=['ingress-markt'], labels=['infra'], resource_deps=['api', 'web'])

include('./Tiltfile-api')
include('./Tiltfile-mariadb')
include('./Tiltfile-web')